<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Dish Details</title>
    <style>
        .body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            
           
            margin: 0;
        }

        .form-container {
            background-color: #fff;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: orangered;
            margin-bottom: 20px;
            text-shadow: -2px 2px 2px black;
            

        }

        .form-group {
            position: relative;
            margin-bottom: 20px;
        }

        label {
            position: absolute;
            top: 10px;
            left: 10px;
            padding: 0 5px;
            background-color: white;
            color: #999;
            transition: 0.3s;
            pointer-events: none;
        }

        input[type="text"],
        input[type="number"],
        input[type="url"],
        textarea,
        select {
            width: 100%;
            padding: 12px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.3s;
            background-color: transparent;
            box-shadow: -2px 2px 2px gray ;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="url"]:focus,
        textarea:focus,
        select:focus {
            border-color: #007bff;
            
        }

        input[type="text"]:focus + label,
        input[type="number"]:focus + label,
        input[type="url"]:focus + label,
        textarea:focus + label,
        input:not(:placeholder-shown) + label,
        textarea:not(:placeholder-shown) + label {
            top: -10px;
            left: 10px;
            font-size: 12px;
            color: #007bff;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        .form-group.avail-status,
        .form-group.veg-status {
            display: flex;
            align-items: center;
            gap: 10px;
            padding-left: 20px;
        }

        .form-group.avail-status label,
        .form-group.veg-status label {
            position: static;
            padding: 0;
            background-color: transparent;
            margin-bottom: 0;
            transform: none;
        }

        button[type="submit"],
        button[type="reset"] {
            width: 48%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        button[type="reset"] {
            background-color: #6c757d;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        button[type="reset"]:hover {
            background-color: #5a6268;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }
        input{
            box-shadow: -2px 2px 2px gray ;
                }
    </style>
</head>
<body>
  <div class="body">
    <div class="form-container">
        <h2>Add New Dish</h2>
        <form action="/FoodSphere/AddDish" method="POST" id="updateDishForm">
            <div class="form-group">
                <input type="text" id="dishname" name="dishname" required placeholder=" ">
                <label for="dishname">Dish Name</label>
            </div>
            <div class="form-group">
                <textarea id="description" name="description" placeholder=" "></textarea>
                <label for="description">Description</label>
            </div>
            <div class="form-group">
                <input type="text" id="price" name="price" required placeholder=" ">
                <label for="price">Price</label>
            </div>
            <div class="form-group">
                <select id="category" name="category" required>
                     <option value="" disabled selected></option> 
                    <option value="Starter">Starter</option>  
                    <option value="Biryani">Biryani</option>
                    <option value="Pizza">Pizza</option>
                    <option value="Burger">Burger</option>
                    <option value="Mandi">Mandi</option> 
                    <option value="Salad">Salad</option>
                    <option value="Sandwich">Sandwich</option>
                    <option value="Soup">Soup</option>
                    <option value="Seafood">Seafood</option>
                    <option value="Dessert">Dessert</option>
                    <option value="Ice Cream">Ice Cream</option>
                    <option value="Cake">Cake</option>

                    <option value="Soft Drink">Soft Drink</option>
                    <option value="Juice">Juice</option>
                    <option value="Coffee">Coffee</option>
                  
                    <option value="Smoothie">Smoothie</option>

               </select>
            </div>
            <div class="form-group veg-status">
                
                <input type="radio" id="veg" name="veg_nonveg" value="Veg" required>
                <label for="veg">Veg</label>
                <input type="radio" id="nonveg" name="veg_nonveg" value="Non-Veg">
                <label for="nonveg">Non-Veg</label>
            </div>
            <div class="form-group avail-status">
                <input type="checkbox" id="availstatus" name="availstatus" value="1" checked>
                <label for="availstatus">Available</label>
            </div>
            <div class="form-group">
                <input type="url" id="imageurl" name="imageurl" placeholder=" ">
                <label for="imageurl">Image URL</label>
            </div>
            <div class="button-group">
                <button type="submit">Add Dish</button>
                <button type="reset">Reset</button>
            </div>
        </form>
    </div>
    </div>

    <script>
        // Example script to handle form submission
    //    document.getElementById('updateDishForm').addEventListener('submit', function(event) {
        //    event.preventDefault();
            // Add logic here to update the dish details
      //      alert('Dish details updated successfully!');
      //  });

        // Optional: Clear form fields
        document.getElementById('updateDishForm').addEventListener('reset', function() {
            document.getElementById('updateDishForm').reset();
        });
    </script>
    
</body>
</html>
