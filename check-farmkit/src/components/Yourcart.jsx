import React, { useState, useEffect } from "react";
import { MdShoppingCart } from "react-icons/md";
import appleimg from "../Images/fresh-apple.jpg";
import Header from "./Header";
import Footer from "./Footer";
import { backendUrl } from "../../url";

export default function YourCart() {
  const [cartItems, setCartItems] = useState([]);
  const [email, setEmail] = useState("");
  const [username, setUsername] = useState("");
  const [showAlert, setShowAlert] = useState(false);

  useEffect(() => {
    // Fetch email from local storage
    const userEmail = localStorage.getItem("email");
    const username = localStorage.getItem("username");
    setEmail(userEmail);
    setUsername(username);
  }, []);

  useEffect(() => {
    // Fetch cart items from the backend
    if (email) {
      fetchCartItems();
    }
  }, [email]); // Run only when email changes

  const fetchCartItems = async () => {
    try {
      const response = await fetch(`${backendUrl}/user/cartItems?email=${email}`);
      if (!response.ok) {
        throw new Error("Failed to fetch cart items");
      }
      const data = await response.json();
      console.log(data);
      setCartItems(Array.isArray(data.cartItems) ? data.cartItems : []);
    } catch (error) {
      console.error("Error fetching cart items:", error.message);
    }
  };

  const removeItem = async (index, productId) => {
    try {
      console.log(email);
      console.log('Sending productId:', productId);
      const response = await fetch(`${backendUrl}/delete_from_cart?product_id=${productId}&email=${email}`, {
        method: 'DELETE'
      });
      if (!response.ok) {
        throw new Error("Failed to remove item from cart");
      }
      // Only update the state if the deletion was successful
      const updatedCartItems = [...cartItems];
      updatedCartItems.splice(index, 1);
      setCartItems(updatedCartItems);
    } catch (error) {
      console.error("Error removing item from cart:", error.message);
    }
  };

  const buyNowAndClearCart = async () => {
    try {
      const requestData = {
        email: email,
        username: username,
        cartItems: cartItems,
        totalAmount: totalAmount
      };

      console.log('Sending request to save cart items:', requestData);

      const responseSaveCart = await fetch(`${backendUrl}/save_cart_items`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestData)
      });

      if (!responseSaveCart.ok) {
        const errorText = await responseSaveCart.text();
        console.error("Failed to save cart items:", errorText);
        throw new Error(`Failed to save cart items: ${responseSaveCart.statusText}`);
      }

      console.log('Cart items saved successfully');

      const responseClearCart = await fetch(`${backendUrl}/clear_cart_items`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email: email })
      });

      if (!responseClearCart.ok) {
        const errorText = await responseClearCart.text();
        console.error("Failed to clear cart items:", errorText);
        throw new Error(`Failed to clear cart items: ${responseClearCart.statusText}`);
      }

      console.log('Cart items cleared successfully');

      setCartItems([]);
      setShowAlert(true); // Show the alert

      setTimeout(() => {
        setShowAlert(false); // Hide the alert after 1 second
      }, 1000);

    } catch (error) {
      console.error("Error buying items:", error.message);
    }
  };

  const totalAmount = cartItems.reduce((total, item) => total + item.price, 0);

  return (
    <div className="w-screen h-screen">
      <Header />

      <div className="flex justify-center">
        <div className="cart text-3xl font-bold">
          <h1 className="flex items-center mt-[32px]">
            <MdShoppingCart className="mr-2" />
            <span>Your Cart</span>
          </h1>
        </div>
      </div>

      {showAlert && (
        <div className="alert bg-green-500 text-white p-4 rounded-md fixed top-16 left-1/2 transform -translate-x-1/2">
          Your items have been sent.
        </div>
      )}

      {cartItems.length === 0 ? (
        <div className="flex justify-center items-center h-full">
          <h1 className="text-2xl">Your cart is empty.</h1>
        </div>
      ) : (
        <div>
          {cartItems.map((item, index) => (
            <div className="main flex justify-center items-center mt-[20px]" key={index}>
              <div className="item w-[900px] h-[110px] bg-white shadow-md flex justify-between items-center">
                <div className="image pl-[12px] pb-[8px] pt-[6px]">
                  <img
                    src={appleimg}
                    alt={item.product_name}
                    className="h-[100px] w-[100px] object-cover"
                  />
                </div>
                <div className="item-name">
                  <h1 className="text-3xl font-bold">{item.product_name}</h1>
                </div>
                <div className="price" style={{ marginRight: "30px" }}>
                  <div className="font-bold mb-[10px]">Rs {item.price}</div>
                  <button
                    className="text-red-500 hover:text-red-700 focus:outline-none font-semibold underline"
                    onClick={() => removeItem(index, item.product_id)}
                  >
                    Remove
                  </button>
                </div>
              </div>
            </div>
          ))}
          <div className="flex justify-center items-center mt-4">
            <div className="text-xl font-bold">Total Amount: Rs {totalAmount}</div>
          </div>
          <div className="flex justify-center items-center mt-4 mb-[72px]">
            <button
              className="bg-green-500 hover:bg-green-800 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-[252px]"
              onClick={() => buyNowAndClearCart()}
            >
              Buy Now
            </button>
          </div>
        </div>
      )}
      <Footer />
    </div>
  );
}
