// Custom Javascript Code for Shop
let customers = [
  'Brian just bought in South B, 20 min ago',
  'Tracy just bought in South B, 15 min ago',
  'Victor just bought in South B, 1 hr ago',
  'Joan just bought in South B, 25 min ago',
  'Sylvia just bought in South B, 55 min ago',
];

let length_of_customers = customers.length;
 let current_customer = 0;

setInterval(function (){

    if(current_customer > (length_of_customers - 1))
        current_customer = 0;
    
    new Noty({
        type: 'success',
        theme: 'metroui',
        layout: 'bottomRight',
        timeout: 2000,
        text: customers[current_customer]
    }).show();

    current_customer++;
}, 100000);


// $("#youtube").mediaelementplayer();