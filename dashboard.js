

let stBatsmanName = localStorage.getItem("index2-striker");
let nstBatsmanName = localStorage.getItem("index2-nstriker");
let bowler = localStorage.getItem("index2-bowler");
let runbtns = document.querySelectorAll(".rbtn");
let truns = document.querySelector("#t-run");
let tovers = document.querySelector("#t-over")
let trr = document.querySelector("#t-rr");


let stbat = document.querySelector("#stBatsmanName");
let nstbat = document.querySelector("#nstBatsmanName");
let bow = document.querySelector("#bow");
const modelBtn=document.querySelector("#model-btn");


stbat.innerHTML = stBatsmanName;
nstbat.innerHTML = nstBatsmanName;
bow.innerHTML = bowler;


// For striker batsman 
let run = document.querySelector("#sRun");
let ball = document.querySelector("#sBall");
let fours = document.querySelector("#s4s");
let sixes = document.querySelector("#s6s");
let SR = document.querySelector("#sSR");


// for Non Striker 
let nrun = document.querySelector("#nSRun");
let nball = document.querySelector("#nsBall");
let nfours = document.querySelector("#ns4s");
let nsixes = document.querySelector("#ns6s");
let nSR = document.querySelector("#nsSR");

//  for Bowler 

let bowOvers = document.querySelector("#bow-over")
let bowMdn = document.querySelector("#bow-mdn")
let bowRun = document.querySelector("#bow-run")
let bowWct = document.querySelector("#bow-wct")
let bowER = document.querySelector("#bow-ER")





const Bowler = {
    over: 0.0,
    M: 0,
    R: 0,
    W: 0,
    ER: 0.0
}



const striker = createPlayer();
const nstriker = createPlayer();
function createPlayer() {
    return {
        run: 0,
        ball: 0,
        fours: 0,
        sixes: 0,
        SR: 0.0
    };
}


let f = 0;

function ballsToOvers(balls) {
    const fullOvers = Math.floor(balls / 6);
    const remainingBalls = balls % 6;
    const totalOvers = fullOvers + remainingBalls / 10;

    return totalOvers.toFixed(1);
}


function thisOver(btnval) {
    let newElement = document.createElement("span");
    const thisElement = document.querySelector("#this-over");
    newElement.innerText = btnval;

    newElement.classList.add("this-over");
    if (btnval === 4) {
        console.log("triggers")
        newElement.classList.add("four-run");
    }

    if (btnval === 6) {
        newElement.classList.add("six-run");
    }
    thisElement.appendChild(newElement);
}

let total_run = 0;
let balls = 0;
let tballs = 0;



runbtns.forEach(button => {
    button.addEventListener("click", () => {
        let btnval = Number(button.innerText.trim());

        // total runs 
        total_run += btnval;
        truns.innerText = total_run;

        // total overs 
        tovers.innerText = ballsToOvers(++tballs);
        // console.log(tovers);
        // console.log(typeof ballsToOvers(tballs++));
        trr.innerText = Math.round(ballsToOvers((total_run) / (tballs)));

        // Bowler part 
        Bowler.R += btnval;
        bowRun.innerText = Bowler.R;

        console.log(Bowler.over)


        bowOvers.innerText = Bowler.over = ballsToOvers(++balls);

        bowER.innerText = Math.round((Bowler.ER = Bowler.R / balls) * 6 * 100) / 100;


        //##################      Bowler data save     ###################

        if(tballs%6==0){
            
        }

        thisOver(btnval);


        // Batsman part 
        if (f === 0) {
            if (btnval === 4) {
                ++striker.fours;
                fours.innerText = striker.fours;
            }

            if (btnval === 6) {
                ++striker.sixes;
                sixes.innerText = striker.fours;
            }

            striker.run += btnval;
            run.innerText = striker.run;
            ball.innerText = ++striker.ball;
            SR.innerText = Math.round((100 * striker.run) / striker.ball);

            if (btnval % 2 != 0) {
                f = 1;
            }

        }

        else if (f === 1) {
            nstriker.run += btnval;
            if (btnval === 4) {
                ++nstriker.fours;
                nfours.innerText = nstriker.fours;
            }

            if (btnval === 6) {
                ++nstriker.sixes;
                nsixes.innerText = nstriker.sixes;
            }


            nrun.innerText = nstriker.run;
            nball.innerText = ++nstriker.ball;
            nSR.innerText = Math.round((100 * nstriker.run) / nstriker.ball);
            if (btnval % 2 != 0) {
                f = 0;
            }
        }

    })
})

