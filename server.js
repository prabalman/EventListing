
// Import all node modules
var express = require ('express');
var http = require ('http');
var mysql = require ('mysql');
var app  = express();
var bodyParser = require ('body-parser');
var path = require ('path');

// parsing form data
app.use(bodyParser.urlencoded({extended: true}));

// date formatting
var dateFormat = require('dateformat');
var now = new Date();

// View engine using EJS
app.set('view engine', 'ejs');

//Import JS and CSS related files
app.use('/js', express.static(path.join(__dirname , "/node_modules/bootstrap/dist/js"))); 
app.use('/js', express.static(path.join(__dirname , "/node_modules/tether/dist/js"))); 
app.use('/js', express.static(path.join(__dirname , "/node_modules/jquery/dist"))); 
app.use('/css', express.static(path.join(__dirname , "/node_modules/bootstrap/dist/css"))); 



//Connect to database
const con = mysql.createConnection({
    host: "localhost",
    user: "root", 
    password: "root",
    database: "nodedb"
});

//Global Site title and base url
const siteTitle = "My Events";
const baseURL = "http://localhost:4000";
0
//Default page loading
//Select Query 
app.get ('/', function (req, res) {
    //Event list
    con.query ('SELECT * FROM e_events ORDER BY e_id ', function (err,result){
        res.render('pages/index', {
            siteTitle: siteTitle,
            pageTitle : "All Events",
            items: result
        });    
        //console.log (result);
    });        
});

//Add new event
app.get ('/event/add', function (req, res) {
    //Event list
        res.render('pages/add-event.ejs', {
            siteTitle: siteTitle,
            pageTitle : "Add new event",
            items: '' 
        });    
});

//Post Method to insert
app.post ('/event/add', function (req, res){

    var query = "INSERT INTO `e_events` (e_name, e_start_date, e_end_date, e_desc, e_location) VALUES(";
        query += " '"+req.body.e_name+"',";
        query += " '"+dateFormat(req.body.e_start_date, "yyyy-mm-dd")+"',";
        query += " '"+dateFormat(req.body.e_end_date, "yyyy-mm-dd")+"',";        
        query += " '"+req.body.e_desc+"',";
        query += " '"+req.body.e_location+"')";

        con.query(query, function (err, result){
            res.redirect(baseURL);
            console.log(err);
        });
});

// Get method to edit
app.get('/event/edit/:id', function(req, res){
    //console.log(req);
    con.query("Select * from e_events where e_id = '"+req.params.id +"'", function (err, result){
       
        result[0].e_start_date = dateFormat(result[0].e_start_date, "yyyy-mm-dd");
        result[0].e_end_date = dateFormat(result[0].e_end_date, "yyyy-mm-dd");

        res.render('pages/edit-event',{
            siteTitle : siteTitle, 
            pageTitle : "Editing event :" + result[0].e_name,
            item: result
        });

    });
});


//Post Method to Edit
app.post ('/event/edit/:id', function (req, res){

    var query = "UPDATE e_events SET";
        query += " e_name = '"+req.body.e_name+"',";
        query += " e_start_date = '"+req.body.e_start_date+"',";
        query += " e_end_date = '"+req.body.e_end_date+"',";        
        query += " e_desc = '"+req.body.e_desc+"',";
        query += " e_location = '"+req.body.e_location+"'";
        query += " where e_events.e_id = "+req.body.e_id+"";

    con.query(query, function (err, result){
        if (result.affectedRows)
        {
            res.redirect(baseURL);
            //console.log(err);
        }            
    });
});


// Get method to delete
app.get('/event/delete/:id', function(req, res){
    
    con.query("DELETE FROM e_events WHERE e_id = '"+req.params.id+"'", function (err, result){
        if (result.affectedRows)
        {
            res.redirect(baseURL);
        }
    });
});


//Connect to server
var server = app.listen (4000, function(){
    console.log ("Server started on port 4000");
});


