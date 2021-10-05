var state = 0;
var stateMax = 3;
const nextBtn = document.getElementById('next')
const backBtn = document.getElementById('back')
if (!localStorage.getItem(login_user)) {
    alert('Your cart is empty ...')
    document.getElementById('home_logo').click()
} else {
    let skip = 0
    for (let i in JSON.parse(localStorage.getItem(login_user))) {
        if (JSON.parse(localStorage.getItem(login_user))[i] !== 0) {
            console.log(i)
            console.log(JSON.parse(localStorage.getItem(login_user))[i])
            skip = 1
        }
    }
    if (skip === 0) {
        alert('Your cart is empty ...')
        document.getElementById('home_logo').click()
    }
}


var userCart = JSON.parse(localStorage.getItem(login_user))

nextBtn.addEventListener('click', function () {
    if (state < stateMax) {
        if (state === 0) {
            sendUserOrder()
            backBtn.innerHTML = 'Back'
            document.getElementById('summary').classList.remove('active')
            document.getElementById('address').classList.add('active')
        }
        if (state === 1) {
            nextBtn.innerHTML = 'Confirm'
            document.getElementById('address').classList.remove('active')
            document.getElementById('payment').classList.add('active')
        }
        if (state === 2) {
            checkout()
            backBtn.innerHTML = 'Home'
            document.getElementById('payment').classList.remove('active')
            document.getElementById('complete').classList.add('active')
        }


        state += 1;

        // Enables 'back' button if disabled
        backBtn.classList.remove("disabled");

        // Adds class to make nodes green
        for (let num = 0; num <= state; num++) {
            let NameClass = `nConfirm${num}`
            let x = document.getElementsByClassName(`${NameClass}`)
            for (let subx of x) {
                subx.classList.add('done')
            }
        }

        // Progress bar animation
        var pBar = (state / stateMax) * 100;
        const progressBar = document.getElementById('progressBar')
        progressBar.style.width = `${pBar}%`


        // Disables 'next' button if end of steps
        if (state === 3) {
            nextBtn.classList.add('disabled')
        }
    }
})

backBtn.addEventListener('click', function () {
    if (state === 0) {
        document.getElementById('total_cart').click()
    }
    if (state === 1) {
        backBtn.innerHTML = 'Back To Cart'
        document.getElementById('summary').classList.add('active')
        document.getElementById('address').classList.remove('active')
    }
    if (state === 2) {
        nextBtn.innerHTML = 'Next'
        document.getElementById('address').classList.add('active')
        document.getElementById('payment').classList.remove('active')
    }
    if (state === 3) {
        document.getElementById('home_logo').click()
    }
    if (state > 0 && state < 3) {
        // Enables 'next' button if disabled
        nextBtn.classList.remove("disabled");

        // removes class that makes nodes green
        for (let num = 3; num >= state; num--) {
            let NameClass = `nConfirm${num}`
            let x = document.getElementsByClassName(`${NameClass}`)
            for (let subx of x) {
                subx.classList.remove('done')
            }
        }

        state -= 1;

        // Progress bar animation
        var pBar = (state / stateMax) * 100;
        const progressBar = document.getElementById('progressBar')
        progressBar.style.width = `${pBar}%`

        // Disables 'back' button if end of steps
    }

});

async function sendUserOrder() {
    const url = 'http://127.0.0.1:8000/order/update-item/'
    for (let i = 0; i < Object.keys(userCart).length; i++) {
        let productId = Object.keys(userCart)[i]
        let quantity = userCart[productId]

        await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrf__token
            },
            body: JSON.stringify({'productId': productId, 'quantity': quantity})
        })
            .then((response) => {
                return response.json()
            })
            .then((data) => {
                console.log({'data': data})
            })
    }
}

function checkout() {
    localStorage.removeItem(login_user)
    document.getElementById('total_cart').innerHTML = '0'
    const url_checkout = 'http://127.0.0.1:8000/order/checkout/'
    fetch(url_checkout, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrf__token,
        }
    })
        .then((response) => {
            return response.json()
        })
}

const urlPro = 'http://127.0.0.1:8000/api/store/products/'
fetch(urlPro, {
    method: 'GET',
})
    .then((response) => {
        return response.json()
    })
    .then((products) => {
        for (let j = 0; j < products.length; j++) {
            if (Object.keys(userCart).includes(products[j].id.toString()) && userCart[products[j].id.toString()] !== 0) {
                AddToTable(products[j], userCart[products[j].id.toString()])
            }
        }
    })
const tBody = document.getElementById('summary_tbody')

function AddToTable(product, quantity) {
    let trTag = document.createElement('tr')
    let firstTd = document.createElement('td')
    firstTd.setAttribute('data-label', 'Image')
    let imgTag = document.createElement('img')
    imgTag.setAttribute('src', product.image)
    imgTag.setAttribute('width', '65em')

    firstTd.appendChild(imgTag)
    let secondTd = document.createElement('td')
    secondTd.setAttribute('data-label', 'Title')
    secondTd.innerHTML = product.title
    let thirdTd = document.createElement('td')
    thirdTd.setAttribute('data-label', 'Unit Price')
    thirdTd.innerHTML = numberWithCommas(product.price).toString()
    let forthTd = document.createElement('td')
    forthTd.setAttribute('data-label', 'Quantity')
    forthTd.innerHTML = quantity
    let fifthTd = document.createElement('td')
    fifthTd.setAttribute('data-label', 'Total Price')
    let tot = quantity * product.price
    fifthTd.innerHTML = numberWithCommas(tot).toString()
    trTag.appendChild(firstTd)
    trTag.appendChild(secondTd)
    trTag.appendChild(thirdTd)
    trTag.appendChild(forthTd)
    trTag.appendChild(fifthTd)
    tBody.appendChild(trTag)
}