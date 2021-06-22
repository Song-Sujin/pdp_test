const data = {
  labels: [
    'Red',
    'Green',
    'Yellow',
    'Grey',
    'Blue'
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [11, 16, 7, 3, 14],
    backgroundColor: [
      'rgb(255, 99, 132)',
      'rgb(75, 192, 192)',
      'rgb(255, 205, 86)',
      'rgb(201, 203, 207)',
      'rgb(54, 162, 235)'
    ]
  }]
};
const config = {
  type: 'polarArea',
  data: data,
  options: {
    plugins:{
      legend:{
        display:false
      },
      title:{
        display: true,
        text: 'Namenode Usage'
      }
    }
  }
};

var myChart = new Chart(
  document.getElementById('chart1'),
  config
);







const data2 = {
  labels: [
    'Eating',
    'Drinking',
    'Sleeping',
    'Designing',
    'Coding',
    'Cycling',
    'Running'
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [65, 59, 90, 81, 56, 55, 40],
    fill: true,
    backgroundColor: 'rgba(255, 99, 132, 0.2)',
    borderColor: 'rgb(255, 99, 132)',
    pointBackgroundColor: 'rgb(255, 99, 132)',
    pointBorderColor: '#fff',
    pointHoverBackgroundColor: '#fff',
    pointHoverBorderColor: 'rgb(255, 99, 132)'
  }, {
    label: 'My Second Dataset',
    data: [28, 48, 40, 19, 96, 27, 100],
    fill: true,
    backgroundColor: 'rgba(54, 162, 235, 0.2)',
    borderColor: 'rgb(54, 162, 235)',
    pointBackgroundColor: 'rgb(54, 162, 235)',
    pointBorderColor: '#fff',
    pointHoverBackgroundColor: '#fff',
    pointHoverBorderColor: 'rgb(54, 162, 235)'
  }]
};



const config2 = {
  type: 'radar',
  data: data2,
  options: {
    elements: {
      line: {
        borderWidth: 3
      }
    },
    plugins:{
      title: {
        display: true,
        text: 'Namenode Heap'
      },
      legend: {
        display: false
      }
    }
  },
};



var myChart2 = new Chart(
  document.getElementById('chart2'),
  config2
);


const data3 = {
  labels: [
    'Red',
    'Blue',
    'Yellow'
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [10, 90],
    backgroundColor: [
      'rgb(54, 162, 235)',
      'rgb(108, 117, 125)'

    ],
    hoverOffset: 4
  }]
};



const config3 = {
  type: 'doughnut',
  data: data3,
  options: {
    plugins:{
      title: {
        display: true,
        text: 'Collected Metrics'
      },
      legend: {
        display: false
      }
    }
  },
};




var myChart3 = new Chart(
  document.getElementById('chart3'),
  config3
);







const data4 = {
  labels: [
    'Red',
    'Blue',
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [50, 50],
    backgroundColor: [
      'rgb(54, 162, 235)',
      'rgb(108, 117, 125)'

    ],
    hoverOffset: 4
  }]
};



const config4 = {
  type: 'doughnut',
  data: data4,
  options: {
    plugins:{
      title: {
        display: true,
        text: 'Collected Metrics'
      },
      legend: {
        display: false
      }
    }
  },
};




var myChart4 = new Chart(
  document.getElementById('chart4'),
  config4
);






const data5 = {
  labels: [
    'Red',
    'Blue',

  ],
  datasets: [{
    label: 'My First Dataset',
    data: [80, 20],
    backgroundColor: [
      'rgb(54, 162, 235)',
      'rgb(255, 99, 132)'
    ],
    hoverOffset: 4
  }]
};



const config5 = {
  type: 'doughnut',
  data: data5,
  options: {
    plugins:{
      title: {
        display: true,
        text: 'Collected Metrics'
      },
      legend: {
        display: false
      }
    }
  },
};




var myChart5 = new Chart(
  document.getElementById('chart5'),
  config5
);







const data6 = {
  labels: [
    'Blue',
    'Yellow'
  ],
  datasets: [{
    label: 'My First Dataset',
    data: [30, 70],
    backgroundColor: [
      'rgb(54, 162, 235)',
      'rgb(108, 117, 125)'
    ],
    hoverOffset: 4
  }]
};



const config6 = {
  type: 'doughnut',
  data: data6,
  options: {
    plugins:{
      title: {
        display: true,
        text: 'Collected Metrics'
      },
      legend: {
        display: false
      }
    }
  },
};




var myChart6 = new Chart(
  document.getElementById('chart6'),
  config6
);
