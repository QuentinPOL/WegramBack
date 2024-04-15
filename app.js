const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');
const jwt = require('jsonwebtoken'); // Importez jsonwebtoken

const app = express();
const port = 8080;
const secretKey = '1234'; // Utilisez une clé secrète pour signer les jetons

// Configurer le middleware body-parser et cors
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//Configuration de la connexion à la base de données MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'wegram'
});
  
// Connexion à la base de données MySQL
db.connect((err) => {
    if (err) {
      console.error('Erreur de connexion à la base de données:', err);
      throw err;
    }
    console.log('Connecté à la base de données MySQL');
});

// Route d'inscription
app.post('/inscription', (req, res) => {
  const { nom, pseudo, email, hashedPassword, dateNaissance } = req.body;

  // Vérification si le pseudo existe déjà
  db.query('SELECT * FROM User WHERE Pseudo = ?', [pseudo], (err, results) => {
    if (err) {
      console.error('Erreur lors de la vérification du pseudo :', err);
      return res.status(500).json({ success: false, error: err });
    }

    if (results.length > 0) {
      return res.status(400).json({ success: false, error: 'Le pseudo est déjà utilisé.' });
    }

    // Vérification si l'email existe déjà
    db.query('SELECT * FROM User WHERE Email = ?', [email], (err, results) => {
      if (err) {
        console.error('Erreur lors de la vérification de l\'adresse e-mail :', err);
        return res.status(500).json({ success: false, error: err });
      }

      if (results.length > 0) {
        return res.status(400).json({ success: false, error: 'L\'adresse e-mail est déjà utilisée.' });
      }

      // Insertion de l'utilisateur dans la base de données
      const sqlInsertion = `INSERT INTO User (Nom, Pseudo, Passwd, Publications, Followers, Following, Birthday, isAdmin, Email, Visibility, PathProfilPicture, Genre, isVerified) 
                            VALUES (?, ?, ?, 0, 0, 0, ?, 0, ?, 'public', '', '', 0)`;
      const values = [nom, pseudo, hashedPassword, dateNaissance, email];

      db.query(sqlInsertion, values, (err, result) => {
        if (err) {
          console.error('Erreur lors de l\'insertion dans la base de données :', err);
          return res.status(500).json({ success: false, error: err });
        }

        // Générer un token JWT après l'inscription réussie
        const userIdx = result.insertId;
        const token = jwt.sign({ userId: userIdx }, secretKey, { expiresIn: '1h' });

        return res.status(200).json({ success: true, token });
      });
    });
  });
});

// Route de connexion
app.post('/connexion', (req, res) => {
  const { emailOrPseudo, hashedPassword } = req.body; // Les infos

  // Requête SQL pour sélectionner l'utilisateur
  const sqlConnexion = `SELECT * FROM User WHERE (Pseudo = ? OR Email = ?) AND Passwd = ?`;
  db.query(sqlConnexion, [emailOrPseudo, emailOrPseudo, hashedPassword], (err, results) => {
      if (err) {
          console.error("Erreur lors de la requête SQL :", err);
          return res.status(500).json({ message: "Une erreur s'est produite lors de la connexion." });
      }

      // Vérifiez si l'utilisateur existe dans la base de données
      if (results.length === 0) {
        // Aucun utilisateur trouvé avec ces identifiants
        return res.status(401).json({ message: "Identifiants invalides. Veuillez réessayer." });
      }

      // L'utilisateur est trouvé, vérifiez maintenant le mot de passe
      const user = results[0];

      // Générez un jeton d'authentification
      const token = jwt.sign({ userId: user.Id }, secretKey, { expiresIn: '1h' });

      // L'utilisateur est authentifié avec succès
      return res.status(200).json({ success: true, token });
  });
});

app.listen(port, () => {
    console.log(`Serveur en cours d'exécution sur le port ${port}`);
});