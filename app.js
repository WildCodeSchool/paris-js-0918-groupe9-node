const express = require ('express');
const morgan = require ('morgan');
const cors = require ('cors');
const bodyParser = require('body-parser')

const app = express();
const user = require('./src/routes/user')
const club = require('./src/routes/club')

app.use(morgan("dev"));
app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use("/user", user);
app.use("/club", club);


app.get('/',(req,res)=>{
    res.send('Start allsponsored')
})

app.listen(5000, (err) => {
    if (err) {
        throw new Error('Something bad happened...');
    }
    console.log(`Server is listening on 5000`);
});