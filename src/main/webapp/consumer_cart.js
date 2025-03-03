

// Display cart items in card format
function displayCart() {
	const cartItems = document.getElementById("cartItems");
	const cartTotal = document.getElementById("cartTotal");

	//get cart from local storage
	let cart = JSON.parse(localStorage.getItem("cart")) || [];
	if (cart.length === 0) {
		cartItems.innerHTML =
			'<p class="text-center">Your cart is empty</p>';
		cartTotal.textContent = "0.00";
	} else {
		cartItems.innerHTML = cart
			.map(
				(item) => `
                        <div class="col-md-6 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                  
                                        <div class="col-md-8">
                                            <h5 class="card-title">${item.productName
					}</h5>
                                            <p class="card-text">Price: ₹${item.price
					}</p>
                                            <div class="d-flex align-items-center">
                                                <button class="btn btn-danger btn-sm me-2" onclick="updateQuantity(${item.productId
					}, ${item.quantity - 1})">
                                                    <i class="bi bi-dash"></i>
                                                </button>
                                                <span class="mx-2">${item.quantity
					}</span>
                                                <button class="btn btn-primary btn-sm" onclick="updateQuantity(${item.productId
					}, ${item.quantity + 1})">
                                                    <i class="bi bi-plus"></i>
                                                </button>
                                            </div>
                                            <p class="card-text mt-2">Total: ₹${(
						item.price * item.quantity
					).toFixed(2)}</p>
                                            <button class="btn btn-danger btn-sm" onclick="removeFromCart(${item.productId
					})">
                                                <i class="bi bi-trash"></i>
                                                Remove
                                            </button>
											
											<button class="btn btn-primary btn-sm" onclick="placeOrder(${item.productId})"><i class="bi bi-cart-plus"></i> Place Order</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `
			)
			.join("");

		// Calculate and display total
		const total = cart.reduce(
			(sum, item) => sum + item.price * item.quantity,
			0
		);
		cartTotal.textContent = total.toFixed(2);
	}
}

// Update quantity of a product in the cart
function updateQuantity(id, newQuantity) {

	//get cart from local storage
	let cart = JSON.parse(localStorage.getItem("cart")) || [];
	const item = cart.find((item) => item.productId === id);
	console.log(item);
	if (item) {
		if (newQuantity < 1) {
			newQuantity = 1; // Ensure quantity doesn't go below 1
		}
		item.quantity = newQuantity;
		
		// save to local storage
		
		localStorage.setItem("cart", JSON.stringify(cart));
		
		displayCart(); // Refresh the cart display
	}
}

// Purchase button action
function purchase() {

	//get cart from local storage
	let cart = JSON.parse(localStorage.getItem("cart")) || [];
	
	if (cart.length === 0) {
		alert("Your cart is empty!");
	} else {
		alert("Thank you for your purchase!");
		cart = []; // Clear the cart
		// save to local storage
		localStorage.setItem("cart", JSON.stringify(cart));
		
		displayCart(); // Refresh the cart display
	}
}

// Initial display of the cart
displayCart();

// Remove a product from the cart
function removeFromCart(id) {

	//get cart from local storage
	let cart = JSON.parse(localStorage.getItem("cart")) || [];
	cart = cart.filter((item) => item.productId !== id);
	
	//save to local storage
	localStorage.setItem("cart", JSON.stringify(cart));
	
	displayCart(); // Refresh the cart display
}

function placeOrder(id) {

	//get cart from local storage
	let cart = JSON.parse(localStorage.getItem("cart")) || [];
	
	const item = cart.find((item) => item.productId === id);
	if (item) {
		window.location.href=`PlaceOrderController?product_id=${item.productId}&quantity=${item.quantity}`;
		
		// remove item from cart
		cart = cart.filter((item) => item.productId !== id);
		
		//save to local storage
		localStorage.setItem("cart", JSON.stringify(cart));
		
		displayCart(); // Refresh the cart display
	}
}
