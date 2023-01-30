let login_form = document.getElementById("login-form")

login_form.addEventListener('submit', async function(event) {
    let postData = {
        username: login_form.username.value,
        password: login_form.password.value
    }
    let response = await fetch(`/api/token/`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(postData)
    })
    if (response.ok) {
        let data = await response.json()
        localStorage.setItem('user-detail', JSON.stringify(data))
        localStorage.setItem('user-token', data.access)
    }
})
