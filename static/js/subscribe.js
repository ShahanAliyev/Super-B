let form = document.getElementById('newsletter-validate-detail')

form.addEventListener('submit', function (event) {
    event.preventDefault()
    let token = localStorage.getItem('user-token')
    let email = document.getElementById('newsletter')
    let data = {email: email.value}
    fetch('/en/api/subscribers/', {
      method: 'POST', // or 'PUT'
      headers: {
        'Content-Type': 'application/json',
        'X-CSRFToken': csrftoken,
      },
      body: JSON.stringify(data),
    })
      .then((response) => {
        if (response.ok){
            alert('Succesfully Registered')
        }else{
            alert('Something went wrong, please try again')
        }
      })
})
