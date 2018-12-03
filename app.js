const express = require ('express');
const morgan = require ('morgan');
const cors = require ('cors');
const bodyParser = require('body-parser')

const app = express();
const users = require('./src/routes/users')
const clubs = require('./src/routes/clubs')

app.use(morgan("dev"));
app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use("/users", users);
app.use("/clubs", clubs);


app.get('/',(req,res)=>{
    res.send('Start allsponsored')
})

app.listen(3030, (err) => {
    if (err) {
        throw new Error('Something bad happened...');
    }
    console.log(`Server is listening on 3030`);
});