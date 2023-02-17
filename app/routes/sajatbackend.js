const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  
  var connection
  function dbconn(){
    var mysql = require('mysql')

    connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 's48_db'
    })
    
    connection.connect()
    
  }
  
  

  
   app.get('/kutya', (req, res) => {
    dbconn()   
      
      connection.query('SELECT * FROM tipus INNER JOIN kutya ON tipus.tipus_id = kutya.kutya_fajtaid', function (err, rows, fields) {
        if (err) throw err
      
        console.log(rows)
        res.send(rows)
      })
      
      connection.end()
  
    })

    app.get('/tipus', (req, res) => {
      dbconn()   
        
        connection.query('SELECT * FROM tipus', function (err, rows, fields) {
          if (err) throw err
        
          console.log(rows)
          res.send(rows)
        })
        
        connection.end()
    

      })

      app.get('/adatoklekerdezese', (req, res) => {
        dbconn()   
          
          connection.query('SELECT * FROM adatok', function (err, rows, fields) {
            if (err) throw err
          
            console.log(rows)
            res.send(rows)
          })
          
          connection.end()
      
        })

      

      app.post('/keres', (req, res) => {
        dbconn()
          
          
          let parancs='SELECT * FROM tipus INNER JOIN kutya ON tipus.tipus_id = kutya.kutya_fajtaid WHERE tipus_nev LIKE "%'+req.body.bevitel1+'%"'
          connection.query(parancs, function (err, rows, fields) {
            if (err) throw err
          
            console.log(rows)
            res.send(rows)
          })
          
          connection.end()
          
        })

        app.post('/kutya_datum', (req, res) => {
          dbconn()
            
            
            let parancs='SELECT * FROM tipus INNER JOIN kutya ON tipus.tipus_id = kutya.kutya_fajtaid WHERE tipus_nev LIKE "%'+req.body.bevitel1+'%"'
            connection.query(parancs, function (err, rows, fields) {
              if (err) throw err
            
              console.log(rows)
              res.send(rows)
            })
            
            connection.end()
            
          })

          app.post('/mentes', (req, res) => {
            dbconn()
              let parancs="INSERT INTO kutya  VALUES (NULL, "+req.body.bevitel1+", '"+req.body.bevitel2+"', '"+req.body.bevitel3+"', NOW())"
              connection.query(parancs, function (err, rows, fields) {
                if (err) 
                    console.log(err)
                  else
                //console.log(rows)
                    res.send("Sikerült a mentés!")
              })
              
              connection.end()
              
            })

            app.post('/adatok', (req, res) => {
              dbconn()
                let parancs="INSERT INTO adatok  VALUES (NULL, '"+req.body.bevitel1+"', '"+req.body.bevitel2+"', '"+req.body.bevitel3+"', 1, NOW())"
                connection.query(parancs, function (err, rows, fields) {
                  if (err) 
                      console.log(err)
                    else
                  //console.log(rows)
                      res.send("Sikerült a mentés!")
                })
                
                connection.end()
                
              })

              app.delete('/torles_kutya', (req, res) => {
                dbconn()
                  let parancs="DELETE FROM kutya WHERE kutya_id="+req.body.bevitel1
                  connection.query(parancs, function (err, rows, fields) {
                    if (err) 
                        console.log(err)
                      else
                    //console.log(rows)
                        res.send("Sikeres törlés!")
                  })
                  
                  connection.end()
                  
                })



app.delete('/torles_adat', (req, res) => {
  dbconn()
    let parancs="DELETE FROM adatok WHERE adatok_id="+req.body.bevitel1
    connection.query(parancs, function (err, rows, fields) {
      if (err) 
          console.log(err)
        else
      //console.log(rows)
          res.send("Sikeres törlés!")
    })
    
    connection.end()
    
  })

};
