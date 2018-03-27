// https://www.sitepoint.com/using-node-mysql-javascript-client/

const mysql = require('mysql');
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'node',
  password: 'node',
  database: 'login'
});
connection.connect((err) => {
  if(err){
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
});

// Reading
connection.query('SELECT * FROM users', (err,rows) => {
  if(err) throw err;

  console.log('Data received from Db:\n');
  console.log(rows);
});

// Creating
/*
const newUser = { id: '2', first_name:'Benson', last_name:'Bishural', email:'benson.bishural@infotmt.com', password:'HelloWorld' };

connection.query('INSERT INTO users SET ?', newUser, (err, res) => {
  if(err) throw err;

  console.log('Last insert ID:', res.insertId);
});
*/
//INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
//(1, 'Anup', 'Shrestha', 'anup.shrestha@infotmt.com', 'HelloWorld');


//updating
connection.query(
  'UPDATE users SET password = ? Where ID = ?',
  ['HelloNepal', 2],
  (err, result) => {
    if (err) throw err;

    console.log(`Changed ${result.changedRows} row(s)`);
  }
);

//deleting
/*connection.query(
  'DELETE FROM users WHERE id = ?', [2], (err, result) => {
    if (err) throw err;

    console.log(`Deleted ${result.affectedRows} row(s)`);
  }
);

*/

/*
connection.query(
  "CALL sp_insert_user('Sajag', 'Shakya','sajag.shakya@infotmt.com','HelloWorld');" ,
  (err, rows) => {
    if (err) throw err;
  }
);
*/

connection.query('CALL sp_getall()',function(err, rows){
  if (err) throw err;

  console.log('Data received from Db:\n');
  //console.log(rows);

  rows[0].forEach( (row) => {
  		console.log(`${row.first_name} ${row.last_name}`);
	});
});

const userLandVariable = 8;

connection.query(`CALL sp_get_user_detail(${mysql.escape(userLandVariable)})`, (err, rows) => {
  if(err) throw err;

  console.log('\nData received from Db:\n');
  console.log(rows[0]);
});

connection.end((err) => {
  // The connection is terminated gracefully
  // Ensures all previously enqueued queries are still
  // before sending a COM_QUIT packet to the MySQL server.
});

