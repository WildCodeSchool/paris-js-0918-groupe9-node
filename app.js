const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const user = require('./src/routes/user')
const club = require('./src/routes/club');
const sponsor = require('./src/routes/sponsor');
const project = require('./src/routes/project');
const signin_club = require('./src/routes/signin_club');
const signin_admin = require('./src/routes/signin_admin');
const project_has_sponsor = require('./src/routes/project_has_sponsor');
const jwt = require('jsonwebtoken');
const jwtSecret = require('./jwtSecret');

app.use(morgan("dev"));
app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));



<<<<<<< HEAD
app.use("/user", user);
app.use("/club", club);
=======
const getToken = req => {
    if (
        req.headers.authorization &&
        req.headers.authorization.split(" ")[0] === "Bearer"
    ) {
        return req.headers.authorization.split(" ")[1]
    }
    return '';
}

const authorize = function (req, res, next) {
    const token = getToken(req);
    console.log(token);
    if (token === '') {
        res.sendStatus(401);
    } else {
        jwt.verify(token, jwtSecret, (err, decoded) => {
            if (err) {
                console.log(err);
                return res.status(401);
            } else {
                console.log({decoded});
                next();
            }
        })
    }
>>>>>>> 0c5ecc8b4412d3442851dba28f78ffa1aacb21ed

}


app.use('/signinclub', signin_club);
app.use('/signinadmin', signin_admin);
app.use("/user", user);
app.use("/club", club);
app.use("/sponsor", sponsor);
// app.use("/sponsor", authorize, sponsor);
//app.use("/project", authorize, project);
app.use("/project", project);
app.use('/project_has_sponsor',project_has_sponsor);




app.get('/', (req, res) => {
    res.send('Start allsponsored')
})


app.listen(3030, (err) => {
    if (err) {
        throw new Error('Something bad happened...');
    }
    console.log(`Server is listening on 3030`);
});