var mysql = require("mysql");
var inquirer = require("inquirer");

var display = false;

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "N@vya_72",
  database: "bamazon"
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("You have successfully connected to the database\n");
  if (!display) 
    displayProducts();
});

function displayProducts() 
{
    // query the database for all available products and display
    connection.query("SELECT * FROM products", function(err, results) {
    if (err) throw err;

    console.log("Welcome to bAmazon. We have following products available.");  
    console.log("Product ID, Product Name, Quantity Available");
    for (var i = 0; i < results.length; i++) 
    {
        console.log(results[i].id + "," + results[i].product_name + ",$" + results[i].price);
    }
    start();
    });
}

function start() 
{
    // once you have displayed the products, asked user for product id and quantity to purchase
    inquirer
      .prompt([
        {
          name: "id",
          type: "input",
          message: "Please enter id of the product you want to purchase:->"
        },
        {
          name: "qty",
          type: "input",
          message: "How much quantity would you like to buy:->"
        }
      ])
      .then(function(answer) {
          console.log("You want to order quntity " + answer.qty + " for product id " + answer.id);
          console.log("Let me check availability...");
          checkAvailability(answer.id, answer.qty);
      })
}

function checkAvailability(id, qty) 
{
    var strQuery = "SELECT * FROM products "
    strQuery = strQuery + " WHERE id = " + id;
    strQuery = strQuery + " AND stock_quantity > " + qty;
    
    connection.query(strQuery, function(err, res) {
        if (err) throw err;
        // process results
        if (res.length === 0)
        {
            console.log("Insufficient quantity or incorrect product id!");
            connection.end();
        }
        else
            updateProduct(id, qty, res[0].price, res[0].product_name);
    })
}

function updateProduct(id, qty, price, product) 
{
  console.log("We have your product in stock. Processing your order for " + qty + " " + product);
  
  var strQuery = "UPDATE products"
  strQuery = strQuery + " SET stock_quantity = stock_quantity -" + qty;
  strQuery = strQuery + " WHERE id = " + id;
  
  connection.query(strQuery, function(err, res) {
  if (err) throw err;
  // process results
  if (res.affectedRows === 1)
  {
    console.log("Thank you. Your order has been fulfilled.");
    console.log("Your total for purchase is $" + qty * price);
    connection.end();
  }
  })
}