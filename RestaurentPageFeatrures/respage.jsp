<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food-Sphere</title>
    <link rel="stylesheet" href="RestaurantPage.css">
    <link rel="icon" href="https://github.com/obito1947/Food-delivery-/blob/main/WhatsApp_Image_2024-08-16_at_00.11.14_9ae1571f-removebg-preview.png?raw=true" type="image/icon type">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" >
    
    
    <% 
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    String message=null;
    if (successMessage != null) {
        message = successMessage;
    } else if (errorMessage != null) {
        message = errorMessage;
      
    }
    if (message!=null ){
%>
        <script>
            window.onload = function() {
                const scrollPosition = sessionStorage.getItem('scrollPosition');
                if (scrollPosition) {
                    window.scrollTo(0, scrollPosition);
                    sessionStorage.removeItem('scrollPosition');
                }

                // Display the success popup
                const successPopup = document.getElementById('successPopup');
                if (successPopup) {
                    successPopup.style.display = 'block';

                    // Hide the popup after 5 seconds
                    setTimeout(function() {
                        successPopup.style.display = 'none';
                    }, 5000);
                }
            };
        </script>
<%
        // Remove the session attribute after displaying the message
        session.removeAttribute("successMessage");
    }
%>


</head>

<body>
     <!-- Profile Logo -->
     <div id="profile-logo" class="profile-logo">
        <img src="https://th.bing.com/th/id/OIP.En-syxyO8aKO3SjmYAgMwQAAAA?rs=1&pid=ImgDetMain" 
           alt="Profile Logo">
    </div>

    <div id="sidebar" class="sidebar">
        <div class="sidebar-content">
            <div class="profile-photo-wrapper">
                <img src="https://th.bing.com/th/id/OIP.En-syxyO8aKO3SjmYAgMwQAAAA?rs=1&pid=ImgDetMain"
                     alt="Profile Photo" class="sidebar-profile-photo" id="sidebarProfilePhoto">
               
            </div>
            <p class="sidebar-profile-name">Gyomei Himejima</p>
            <p>&bull;&ensp;working hours:10.00-10.00</p>
            <p>&bull;&ensp;Number items available : 30</p>
            <p>&bull;&ensp;Number items in the menu : 70</p>
            <p>&bull;&ensp;Number of Orders Delivered : 150</p>
            <p>&bull;&ensp;Number of orders Yet to be delivered: 50</p>
            <p>&bull;&ensp;Rating of my Resturant:4.5</p>
            <p class="edit-profile"><a href="#" id="editProfileBtn"><i class="fa-solid fa-user-edit"></i> &emsp;Edit Profile</a></p>
            <hr>
            <p class="logout"><a href="#"><i class="fa-solid fa-sign-out-alt"></i> &emsp;Logout</a></p> 
        </div>
    </div>
    
   <!-- Popup Window -->
<div id="editProfilePopup" class="popup">
    <div class="popup-content">
        <span class="close-btn" id="closePopup">&times;</span>
        <h2>Edit Profile</h2>
        <form id="editProfileForm">
            <div class="profile-photo-section">
                <div class="profile-photo-wrapper">
                    <img src="https://th.bing.com/th/id/OIP.En-syxyO8aKO3SjmYAgMwQAAAA?rs=1&pid=ImgDetMain"
                         alt="Profile Photo" class="profile-photo" id="popupProfilePhoto">
                    <span class="edit-icon"><i class="fa-solid fa-pencil-alt"></i></span>
                </div>
                <input type="file" id="profilePhotoInput" accept="image/*" style="display:none;">
            </div>

            <fieldset>
                <legend>Edit Profile Information</legend>
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" value="Gyomei Himejima"><br>

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="GyomeiH"><br>

                <label for="email">Email ID:</label>
                <input type="email" id="email" name="email" value="gyomei@example.com"><br>

                <label for="description">Description:</label>
                <textarea id="description" name="description">Your description here...</textarea><br>
                
                <label for="CurrentPassword">Current Password:</label>
                <input type="password" id="CurrentPassword" name="CurrentPassword"><br>

                <label for="securityQuestion">Security Question:</label>
                <select id="securityQuestion" name="securityQuestion">
                    <option value="favoriteColor">What is your favorite color?</option>
                    <option value="petName">What is your pet's name?</option>
                    <option value="birthPlace">Where were you born?</option>
                </select><br>

                <label for="securityAnswer">Answer:</label>
                <input type="text" id="securityAnswer" name="securityAnswer"><br>

                <div id="passwordFields" style="display: none;">
                    <label for="newPassword">New Password:</label>
                    <input type="password" id="newPassword" name="newPassword"><br>

                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" "required"><br> 
                </div>
                <button type="button" id="changePasswordBtn">Change Password</button><br>

               <center><button type="submit">Save</button></center> 
            </fieldset>
        </form>
    </div>
</div>

    

    <div id="main-content" class="main-content">

    <header>
        <div class="logo">
                <img src="https://github.com/obito1947/Food-delivery-/blob/main/WhatsApp_Image_2024-08-16_at_00.11.14_9ae1571f-removebg-preview.png?raw=true" alt="Food-Sphere Logo" class="shadow-image">
                <center><h1>Food- Sphere</h1></center>
        </div>
    </header>
    <nav>

        <ul>
            <li><a href="Resturantpage.html"><i class="fa-solid fa-home nav-icon"></i> Home</a></li>
            <li><a href="#" id="AboutUsBtn"><i class="fa-solid fa-info-circle nav-icon"></i> About</a></li>
            <li><a href="#" id="contactUsBtn" ><i class="fa-solid fa-envelope nav-icon"></i> Contact Us</a></li>
        </ul>
    </nav>
    <div  class="resturant-section">
        <h2>DemonSlayer Corp.</h2>
    </div>
    <div class="slider-container">
        <div class="slider-wrapper">
            <div class="slider">
              <div class="slider-item" >  <img src="https://thumbs.dreamstime.com/b/vector-illustration-your-design-order-food-home-guy-lucky-to-bicycle-hand-holds-smartphone-delivery-concept-224621273.jpg" alt="Image 1" /></div>
              
                  <div class="slider-item" > <img src="https://wallpapercave.com/wp/wp10400621.jpg"alt="Image 2"/></div>

                    <div class="slider-item" > <img src="https://i.pinimg.com/originals/cc/b2/02/ccb20235b94c60385df5d1b9c863688f.jpg"alt="Image 3"/></div>

                      <div class="slider-item" > <img src="https://azurlane.netojuu.com/images/0/0d/Skin_BG_519.png" alt="Image 4" /></div>

                        <div class="slider-item" > <img src="https://th.bing.com/th/id/R.e9979bbc326dd4a8ba7d982c31dbe072?rik=iLYH3kSvlDOR7A&riu=http%3a%2f%2fexecutivebillingsource.org%2fimages%2fheaderbanner%2fbanner_60f3756a71a33.jpg&ehk=yuWoFY4WtUvWAoiyf2cmjVLWaNtENaULGxnHgAE93iI%3d&risl=&pid=ImgRaw&r=0" alt="Image 5" /></div>
                          <!-- Add more images as needed -->
            </div>
        </div>
        <button class="prev" onclick="prevSlide()">❮</button>
        <button class="next" onclick="nextSlide()">❯</button>
    </div><br>

<div class="section">
    <p></p><br>
    <div class="product-grid">

        <!-- Item 1 -->
        <div class="product-card">
            <img src="https://raw.githubusercontent.com/obito1947/Food-delivery-/images/Food.webp"
                alt="item 1" class="item" data-modal="item1Modal"> 
            <div class="info">
                <h3 class="item" data-modal="item1Modal">Add Dish</h3>
            </div>
        </div>
        
        <div id="successPopup" class="success-popup">
            <p><%=message %></p>
        </div>
        <!-- Modal for Item 1 -->
        <div id="item1Modal" class="modal">
            <div class="modal-content">
                <span class="close-button">&times;</span>
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
                                <select id="category" name="category" placeholder="category" required>
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
                                <button type="submit" onclick="yourSubmitFunction()">Add Dish</button>
                                <button type="reset">Reset</button>
                            </div>
                        </form>
                    </div>
                    </div>
            </div>
        </div>

        <!-- Item 2 -->
        <div class="product-card">
            <img src="https://raw.githubusercontent.com/obito1947/Food-delivery-/images/UpdateFood.webp"
                alt="item 2" class="item" data-modal="item2Modal">
            <div class="info">
                <h3 class="item" data-modal="item2Modal" onclick="yourSubmitFunction()">Update Dish</h3>
            </div>
        </div>
        <!-- Modal for Item 2 -->
        <div id="item2Modal" class="modal">
            <div class="modal-content">
                <span class="close-button">&times;</span>
                <div class="form-container2">
                    <h2>Update Dish Details</h2>
                    <form id="updateDishForm" action="/FoodSphere/UpdateDish" method="post">
                        <!-- Select Dish -->
                        <div class="form-group">
                            <label for="dishSelect">Select Dish</label>
                            <select id="dishSelect" name="dishSelect" required>
                                <option value="" disabled selected>Select a dish</option>
                            <%
							    ResultSet dishData = (ResultSet) session.getAttribute("dishData");
							    if (dishData != null) {
							    	
							        try {
							            while (dishData.next()) {
							            	
							%>
							                <option value="<%= dishData.getString("dishname")%>">
							                    <%= dishData.getString("dishname")%>
							                </option>
							<%
							            }
							        } catch (Exception e) {
							           
							        }
							    } else {
							    	
							    }
							%>

                            </select>
                        </div>
                
                        <!-- Select Detail to Update -->
                        <div class="form-group">
                            <label for="updateFieldSelect">Select Detail to Update</label>
                            <select id="updateFieldSelect" name="updateFieldSelect" required>
                                <option value="" disabled selected>Select a detail</option>
                                <option value="dishname">Dish Name</option>
                                <option value="description">Description</option>
                                <option value="price">Price</option>
                                <option value="category">Category</option>
                                <option value="availstatus">Availability Status</option>
                                <option value="imageurl">Image URL</option>
                                <option value="veg_or_nonveg">Veg/Non-Veg Status</option>
                            </select>
                        </div>
                
                        <!-- Input for New Value -->
                        <div class="form-group hidden" id="newValueGroup">
                            <label for="newValue">Enter New Value</label>
                            <input type="text" id="newValue" name="newValue">
                        </div>
                
                        <!-- Category Selection Box -->
                        <div class="form-group hidden" id="categorySelectGroup">
                            <label for="categorySelect">Select Category</label>
                            <select id="categorySelect" name="categorySelect">
                                <option value="" disabled selected>Select a category</option>
                                <option value="Appetizer">Appetizer</option>
                                <option value="Main Course">Main Course</option>
                                <option value="Dessert">Dessert</option>
                                <option value="Beverage">Beverage</option>
                            </select>
                        </div>
                
                        <!-- Veg/Non-Veg Radio Buttons -->
                        <div class="form-group hidden" id="vegStatusGroup">
                            <label>Veg/Non-Veg Status</label>
                            <div class="radio-group">
                                <label><input type="radio" name="vegStatus" value="Vegetarian"> Veg</label>
                                <label><input type="radio" name="vegStatus" value="Non-Vegetarian"> Non-Veg</label>
                            </div>
                        </div>
                
                        <!-- Update Button -->
                        <button type="submit" class="update-button" onclick="yourSubmitFunction()">Update Dish</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Item 3 -->
        <div class="product-card">
            <img src="https://raw.githubusercontent.com/obito1947/Food-delivery-/images/deletefood_landscape.webp"
                alt="item 3" class="item" data-modal="item3Modal">
            <div class="info">
                <h3 class="item" data-modal="item3Modal"> Remove Dish</h3>
            </div>
        </div>
        <!-- Modal for Item 3 -->
        <div id="item3Modal" class="modal">
            <div class="modal-content">
                <span class="close-button">&times;</span>
                <div class="form-container3">
                    <h2>Remove Dish</h2>
                    <form action="/FoodSphere/RemoveDish" method="POST" id="removeDishForm">
                        <div class="form-group">
                            <select id="dishname" name="dishname" required>
                                <option value="" disabled selected>Select Dish</option>
                                <!-- Options should be dynamically populated from the database -->
                                
                                <%
							     ResultSet dishData1 = (ResultSet) session.getAttribute("dishData");
							    if (dishData1 != null) 
							    { 
							    	
							        try {
							        	
							        	
							        	dishData1.beforeFirst();
							        			
							            while (dishData1.next()) {
							            	
							            	
							%>
							                <option value="<%= dishData1.getString("dishname")%>">
							                    <%= dishData1.getString("dishname")%>
							                </option>
							<%
							            }
							        } catch (Exception e) {
							        	System.out.println("exception raised "+e);
							        }
							    } else {
							    	System.out.println("data is not available");
							    }
							%>

                                <option value="panner Biryani">Panner biryani</option>
                                <option value="Dish 3">burger</option>
                            </select>
                            <label for="dishname">Dish Name</label>
                        </div>
                        <button type="submit" onclick="yourSubmitFunction()" >Remove Dish</button>
                        <div class="confirmation-message">
                            This action cannot be undone.
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Item 4 -->
        <div class="product-card">
            <img src="https://freedesignfile.com/upload/2015/02/Vector-set-of-restaurant-menu-design-graphics-01.jpg"
                alt="item 4" class="item" data-modal="item4Modal">
            <div class="info">
                <h3 class="item" data-modal="item4Modal">Check Menu</h3>
            </div>
        </div>
        <!-- Item 5 -->
        <div class="product-card">
            <img src="https://th.bing.com/th/id/R.f8ba7461e513da166fd662507d5844c0?rik=FwqmFAsRapFSnw&riu=http%3a%2f%2fmoney.gigamundo.com%2fwp-content%2fuploads%2f2021%2f07%2fstock-market-today-1102201-scaled.jpg&ehk=kiJ%2fh3zUqdTAlySgYin%2bYxi%2fbTx7zh6NHEmV1rHd6%2f4%3d&risl=&pid=ImgRaw&r=0"
                alt="item 5" class="item" data-modal="item5Modal">
            <div class="info">
                <h3 class="item" data-modal="item5Modal">View Analysis</h3>
            </div>
        </div>
        <!-- Modal for Item 5 -->
        <div id="item5Modal" class="modal">
            <div class="modal-content1">
                <span class="close-button">&times;</span>
                <div class="container4">
                    <h1>Restaurant Report Analysis</h1>
            
                    <div class="statistics">
                        <div class="stat-card">
                            <h2 id="totalOrders">0</h2>
                            <p>Total Orders This Month</p>
                        </div>
                        <div class="stat-card">
                            <h2 id="monthIncome">$0</h2>
                            <p>Income This Month</p>
                        </div>
                        <div class="stat-card">
                            <h2 id="totalIncome">$0</h2>
                            <p>Total Income</p>
                        </div>
                        <div class="stat-card">
                            <h2 id="totalCustomers">0</h2>
                            <p>Total Customers</p>
                        </div>
                    </div>
            
                    <div class="order-history">
                        <h2>Previous Orders</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Date</th>
                                    <th>Dish Name</th>
                                    <th>Quantity</th>
                                    <th>Total Price</th>
                                </tr>
                            </thead>
                            <tbody id="orderTableBody">
                                <!-- Orders will be dynamically inserted here -->
                            </tbody>
                        </table>
                        <div id="noOrdersMessage" class="no-orders">No orders placed yet.</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Item 6 -->
        <div class="product-card">
            <img src="https://th.bing.com/th/id/R.20143cd2824099495437cac2b06014db?rik=6M7qb3nyOfMAbQ&riu=http%3a%2f%2ftrailheadtechnology.com%2fwp-content%2fuploads%2f2021%2f07%2ffeedback.jpg&ehk=RPyhXemdpVi8D1mTaYb2E5I%2bc2Utkt843%2b0QyRsb68o%3d&risl=&pid=ImgRaw&r=0"
                alt="item 6" class="item" data-modal="item6Modal">
            <div class="info">
                <h3 class="item" data-modal="item6Modal">View Feedback</h3>
            </div>
        </div>
        <!-- Modal for Item 6 -->
        <div id="item6Modal" class="modal">
            <div class="modal-content2">
                <span class="close-button">&times;</span>
                <div class="feedback-container">
                    <h2>Customer Feedback</h2>
                    <div class="feedback-card">
                        <h3>John Doe</h3>
                        <p>"The pizza was absolutely delicious! The crust was perfectly crispy, and the toppings were fresh and flavorful."</p>
                        <div class="dish-name">Dish: Margherita Pizza</div>
                        <div class="rating">Rating: ★★★★★</div>
                        <div class="timestamp">August 19, 2024</div>
                    </div>
                    <div class="feedback-card">
                        <h3>Jane Smith</h3>
                        <p>"Loved the biryani! It was packed with spices and had the right amount of heat. Will definitely order again."</p>
                        <div class="dish-name">Dish: Chicken Biryani</div>
                        <div class="rating">Rating: ★★★★☆</div>
                        <div class="timestamp">August 18, 2024</div>
                    </div>
                    <!-- Additional feedback cards can be added here -->
                </div>
            </div>
        </div>

    </div>
    <div id="extra-content" class="container3" style="display: none;">
        <h1 class="container3-title">Menu</h1>
        <div class="card">
            <div class="card-image">
                <img src="https://www.indianpolitics.co.in/wp-content/uploads/2021/02/dosa_c.jpg" alt="dosa">
            </div>
            <div class="card-text">
                <p class="card-meal-type">
                    south indian special
                </p>
                <h2 class="card-title">
                    Dosa
                </h2>
                <p class="card-body">
                    Experience the crisp, golden perfection of our dosas, served with an array of flavorful chutneys and sambar.
                     Each dosa is expertly crafted to deliver a deliciously satisfying taste of traditional South Indian cuisine
                </p>
            </div>
          
        </div>
     
     
    				  <%
							     ResultSet dishData2 = (ResultSet) session.getAttribute("dishData");
							    if (dishData2 != null) 
							    { 
							    	
							        try {
							        	
							        	
							        	dishData2.beforeFirst();
							        			
							            while (dishData2.next()) {
							            	
							            	
							%>
							            <div class="card">
							            <div class="card-image">
							                <img src="<%=dishData2.getString("imageurl")%>" alt="burger">
							            </div>
							            <div class="card-text">
							                <p class="card-meal-type">
							                   <%=dishData2.getString("restname")%>
							                </p>
							                <h2 class="card-title">
							                    <%=dishData2.getString("dishname")%>
							                </h2>
							                <p class="card-body">
							                    <%=dishData2.getString("description")%>
							                    <p class="price"> Price: &#8377;<%=dishData2.getString("price")%><p>
							                </p>
							            </div>
							            
							        </div>    
							               
							<%
							            }
							        } catch (Exception e) {
							        	System.out.println("exception raised "+e);
							        }
							    } else {
							    	System.out.println("data is not available");
							    }
							%>
        

        
        

        <div class="card">
            <div class="card-image">
                <img src="https://images2.alphacoders.com/108/1085778.jpg" alt="burger">
            </div>
            <div class="card-text">
                <p class="card-meal-type">
                    Restaurent Name
                </p>
                <h2 class="card-title">
                    Dish name
                </h2>
                <p class="card-body">
                    Descrpition 
                    <p class="price"> Price: &#8377;500<p>
                </p>
            </div>
            
        </div>

        <div class="card">
            <div class="card-image">
                <img src="https://th.bing.com/th/id/OIP.S4xZSae4ZW5rwZze55KzzQHaHa?rs=1&pid=ImgDetMain" alt="noodles">
            </div>
            <div class="card-text">
                <p class="card-meal-type">
                    Chinese Special
                </p>
                <h2 class="card-title">
                    Noodles
                </h2>
                <p class="card-body">
                    Savor our delectable noodles, perfectly cooked and tossed in savory sauces with a medley of fresh, crisp vegetables.
                     Each bowl offers a delightful combination of flavors and textures that will keep you coming back for more
            </div>
           
        </div>
       

       
</div>

    <section class="about-section" id="about-section">
        <div class="container">
            <h1>About DemonSlayer Corp.</h1>
            <p>Welcome to <strong>DemonSlayer Corp.</strong>, your ultimate online food delivery platform designed to bring
                 the best dining experiences right to your doorstep. Whether you're craving a gourmet meal from your 
                 favorite restaurant, a quick snack, or something healthy, Food Sphere has got you covered.</p>
            <p>Our mission is to connect food lovers with a wide array of culinary delights from local eateries, 
                popular chains, and unique hidden gems. We pride ourselves on offering a seamless, user-friendly 
                platform where you can explore diverse menus, customize your orders, and enjoy fast, reliable 
                delivery—all with just a few clicks.</p>
            <p>At Food Sphere, we believe that great food should be accessible to everyone, anytime, anywhere. We re 
                dedicated to providing top-notch customer service, ensuring that your meals are prepared fresh, delivered
                 promptly, and meet your expectations every time.</p>
        </div>
    </section>
    <script>
        document.getElementById('AboutUsBtn').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('about-section').scrollIntoView({ behavior: 'smooth' });
});

    </script>

</div>

        <div id="contact-section" class="contact-section">
            <h2>Contact Us</h2>
            <p>If you have any questions or need assistance, feel free to reach out to us.</p>
            <form>
                <input type="text" placeholder="Your Name" required>
                <input type="email" placeholder="Your Email" required>
                <textarea rows="5" placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>
        </div>
   
    
        <footer>
            <div class="footer-content">
                        <div class="footer-link-section">
                            <ul>
                                <li><a href="mailto:support@muhilanstore.com">support@muhilanstore.com</a></li>
                                <li><a href="tel:+1234567890">+1 (234) 567-890</a></li>
                                <li><a href="#">1234 Market St, San Francisco, CA</a></li>
                            </ul>
                         </div>
                    <div class="social-icons">
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                    <p>&copy; 2024 Muhilan Store. All rights reserved.</p>
                </div>
           
        </footer>
    
         <script>
            document.getElementById('contactUsBtn').addEventListener('click', function(event) {
        event.preventDefault();
        document.getElementById('contact-section').scrollIntoView({ behavior: 'smooth' });
        });
    
        </script>
      <script>
        // Toggle sidebar when profile logo is clicked
        document.getElementById('profile-logo').addEventListener('click', function(event) {
            document.getElementById('sidebar').classList.toggle('active');
            event.stopPropagation();  // Prevent click event from propagating to the body
        });
    
        // Close the sidebar if clicking outside of it
        document.addEventListener('click', function(event) {
            const sidebar = document.getElementById('sidebar');
            const profileLogo = document.getElementById('profile-logo');
    
            // Check if the click happened outside the sidebar and profile logo
            if (!sidebar.contains(event.target) && !profileLogo.contains(event.target)) {
                sidebar.classList.remove('active');
            }
        });
    </script>
    
    <script>
       // Get all modal buttons
// Get all items that can trigger a modal
var items = document.querySelectorAll('.item');

// Iterate over each item and add click event listeners
items.forEach(function(item) {
    item.addEventListener('click', function() {
        var modalId = this.getAttribute('data-modal');
        var modal = document.getElementById(modalId);
        modal.style.display = "block";
    });
});

// Get all elements that close the modal
var closeButtons = document.querySelectorAll('.close-button');

// Add click event to close the modal
closeButtons.forEach(function(button) {
    button.addEventListener('click', function() {
        var modal = button.closest('.modal');
        modal.style.display = "none";
    });
});

// Close modal when clicking outside of the modal content
window.onclick = function(event) {
    var modals = document.querySelectorAll('.modal');
    modals.forEach(function(modal) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });
}


        </script>
    <!--- Item 4 menu activation-->
    <!--- Item 4 menu activation-->
    <script>
       document.querySelectorAll('.item').forEach(item => {
    item.addEventListener('click', function() {
        const modal = document.getElementById(this.getAttribute('data-modal'));
        if (modal) {
            modal.style.display = "block";
        }
    });
});

document.querySelectorAll('.close-button').forEach(button => {
    button.addEventListener('click', function() {
        this.closest('.modal').style.display = "none";
    });
});

window.onclick = function(event) {
    if (event.target.classList.contains('modal')) {
        event.target.style.display = "none";
    }
};

document.querySelector('[data-modal="item4Modal"]').addEventListener('click', function() {
    const extraContent = document.getElementById('extra-content');
    if (extraContent.style.display === 'flex') {
        extraContent.style.display = 'none';
    } else {
        extraContent.style.display = 'flex';
    }
});
</script>
    <!----code for pop-up edit profile---->
    <script>
    // Get elements
    const editProfileBtn = document.getElementById("editProfileBtn");
    const editProfilePopup = document.getElementById("editProfilePopup");
    const closePopup = document.getElementById("closePopup");
    const sidebarProfilePhoto = document.getElementById("sidebarProfilePhoto");
    const popupProfilePhoto = document.getElementById("popupProfilePhoto");
    const profilePhotoInput = document.getElementById("profilePhotoInput");
    const editIcons = document.querySelectorAll('.edit-icon'); // Select all edit icons
    
    // Open popup on Edit Profile click
    editProfileBtn.addEventListener("click", () => {
        // Sync the popup profile photo with the current sidebar profile photo
        popupProfilePhoto.src = sidebarProfilePhoto.src;
        editProfilePopup.style.display = "block";
    });
    
    // Close popup on close button click
    closePopup.addEventListener("click", () => {
        editProfilePopup.style.display = "none";
    });
    
    // Close popup on outside click
    window.addEventListener("click", (event) => {
        if (event.target === editProfilePopup) {
            editProfilePopup.style.display = "none";
        }
    });
    
    // Open file dialog on photo or edit icon click
    function triggerFileInput() {
        profilePhotoInput.click();
    }
    
    popupProfilePhoto.addEventListener("click", triggerFileInput);
    editIcons.forEach(icon => {
        icon.addEventListener("click", triggerFileInput);
    });
    
    // Change profile photo
    profilePhotoInput.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                // Update both the popup and sidebar photos
                popupProfilePhoto.src = e.target.result;
                sidebarProfilePhoto.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });
</script>
<!---- Script for password-->
<script>
    // Get elements
const changePasswordBtn = document.getElementById("changePasswordBtn");
const passwordFields = document.getElementById("passwordFields");

// Show password fields after answering security question
changePasswordBtn.addEventListener("click", () => {
    const securityAnswer = document.getElementById("securityAnswer").value;
    
    // Simple validation to check if the security answer is filled
    if (securityAnswer.trim() !== "") {
        passwordFields.style.display = "block";
        changePasswordBtn.style.display = "none";
    } else {
        alert("Please answer the security question before changing the password.");
    }
});

</script>
<!---Add Dish-->
<script>
    // Example script to handle form submission
    
    document.getElementById('updateDishForm').addEventListener('reset', function() {
        document.getElementById('updateDishForm').reset();
    });
</script>
<!--Update dish-->
<script>
    const updateFieldSelect = document.getElementById('updateFieldSelect');
    const newValueGroup = document.getElementById('newValueGroup');
    const newValueInput = document.getElementById('newValue');
    const categorySelectGroup = document.getElementById('categorySelectGroup');
    const vegStatusGroup = document.getElementById('vegStatusGroup');

    updateFieldSelect.addEventListener('change', function () {
        // Hide all dynamic input fields
        newValueGroup.classList.add('hidden');
        newValueInput.removeAttribute('required');
        categorySelectGroup.classList.add('hidden');
        vegStatusGroup.classList.add('hidden');

        const selectedField = updateFieldSelect.value;

        if (selectedField === 'price') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'number';
            newValueInput.placeholder = 'Enter new price';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'description') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'text';
            newValueInput.placeholder = 'Enter new description';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'dishname') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'text';
            newValueInput.placeholder = 'Enter new name';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'availstatus') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'text';
            newValueInput.placeholder = 'Enter new availability status';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'imageurl') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'text';
            newValueInput.placeholder = 'Enter new image URL';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'category') {
            categorySelectGroup.classList.remove('hidden');
        } else if (selectedField === 'veg_or_nonveg') {
            vegStatusGroup.classList.remove('hidden');
        }
    });
</script>
<!--- Remove Dish-->
<script>
    document.getElementById('removeDishForm').addEventListener('submit', function(event) {
        if (!confirm('Are you sure you want to remove this dish? This action cannot be undone.')) {
            event.preventDefault();
        }
    });
</script>
<!--View Analysis-->
<script>
    // Example data, replace with actual data fetched from your backend
    const reportData = {
        totalOrders: 56,
        monthIncome: 1345.67,
        totalIncome: 8903.45,
        totalCustomers: 120,
        previousOrders: [
            { id: 1, date: '2024-08-01', dishName: 'Pasta', quantity: 2, totalPrice: 19.99 },
            { id: 2, date: '2024-08-03', dishName: 'Pizza', quantity: 1, totalPrice: 12.99 },
            { id: 3, date: '2024-08-05', dishName: 'Salad', quantity: 3, totalPrice: 21.50 },
            // Add more orders as needed
        ]
    };

    document.getElementById('totalOrders').textContent = reportData.totalOrders;
    document.getElementById('monthIncome').textContent = `$${reportData.monthIncome.toFixed(2)}`;
    document.getElementById('totalIncome').textContent = `$${reportData.totalIncome.toFixed(2)}`;
    document.getElementById('totalCustomers').textContent = reportData.totalCustomers;

    const orderTableBody = document.getElementById('orderTableBody');
    const noOrdersMessage = document.getElementById('noOrdersMessage');

    if (reportData.previousOrders.length > 0) {
        noOrdersMessage.style.display = 'none';

        reportData.previousOrders.forEach(order => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${order.id}</td>
                <td>${order.date}</td>
                <td>${order.dishName}</td>
                <td>${order.quantity}</td>
                <td>$${order.totalPrice.toFixed(2)}</td>
            `;
            orderTableBody.appendChild(row);
        });
    } else {
        noOrdersMessage.style.display = 'block';
    }
</script>
<!-- save scrolling location -->

<script>
    function saveScrollPosition() {
        sessionStorage.setItem('scrollPosition', window.scrollY);
    }

    function yourSubmitFunction() {
        saveScrollPosition();
        // Simulate a redirect (e.g., form submission or window.location.href change)
      
    }
    function showPopup(message, type) {
        var popup = document.createElement('div');
        popup.className = 'popup';
        if (type === 'error') {
            popup.classList.add('error');
        }
        popup.innerHTML = message;
        document.body.appendChild(popup);
        popup.style.display = 'block';
        setTimeout(function() {
            popup.remove();
        }, 3000); // Popup disappears after 3 seconds
    }

  
</script>

<!----Sliding Animation after resturant name-->
<script>
    let currentIndex = 0;

function showSlide(index) {
    const slider = document.querySelector('.slider');
    const totalSlides = document.querySelectorAll('.slider-item').length;

    if (index >= totalSlides) {
        currentIndex = 0;
    } else if (index < 0) {
        currentIndex = totalSlides - 1;
    } else {
        currentIndex = index;
    }

    const offset = -currentIndex * 100; // Shift slider by 100% for each slide
    slider.style.transform = `translateX(${offset}%)`;
}

function nextSlide() {
    showSlide(currentIndex + 1);
}

function prevSlide() {
    showSlide(currentIndex - 1);
}

</script>

    </body>
</html>
    
