document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("contact-form");
  const response = document.getElementById("form-response");

  form.addEventListener("submit", async function (e) {
    e.preventDefault();
    const data = {
      name: form.name.value,
      email: form.email.value,
      message: form.message.value
    };
    try {
      const res = await fetch("/contact", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
      });
      const result = await res.json();
      response.textContent = result.message;
    } catch (err) {
      response.textContent = "Failed to send message.";
    }
    form.reset();
  });
});

