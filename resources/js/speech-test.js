document.addEventListener('DOMContentLoaded', function() {

    const colors = ['red', 'orange', 'yellow', 'green', 'blue', 'white', 'violet', 'grey', 'black'];
    document.getElementById("color-list").innerText += colors.join(", ");

    function changeColor(color) {
        color = color.toLowerCase().trim();
        if (colors.includes(color)) {
            document.body.style.backgroundColor = color;
        }
    }

    let synthesis = window.speechSynthesis;
    let voices = synthesis.getVoices();
    synthesis.speak(new SpeechSynthesisUtterance('Привет'));

    let recognition = new webkitSpeechRecognition() ||
        root.mozSpeechRecognition ||
        root.msSpeechRecognition ||
        root.oSpeechRecognition ||
        root.SpeechRecognition;

    recognition.continuous = true;
    recognition.maxAlternatives = 2;

    function startRecording() {
        recognition.onresult = function(event) {
            let output = document.getElementById("output");
            let resultList = document.getElementById("result-list");
            output.value = "";
            resultList.innerHTML = "";
            for (let i = 0; i < event.results.length; i++) {
                let transcript = event.results[i][0].transcript;
                let confidence = Number(event.results[i][0].confidence.toFixed(3)).toString();
                changeColor(transcript);
                output.value += transcript;
                confidence += '<button class="btn btn-sm btn-secondary">Speech</button>';
                if (event.results[i][1]) {
                    confidence += ' (' + event.results[i][1].transcript.trim() + '  -  ' + Number(event.results[i][1].confidence.toFixed(3)).toString() + ')';
                }
                resultList.innerHTML += "<p>" + transcript + "  -  " + confidence + "</p>";
            }
        };
        recognition.start();
    }

    function stopRecording() {
        recognition.stop();
        document.getElementById("output").value = "";
        document.getElementById("result-list").innerHTML = "";
    }

    let startButton = document.getElementById("start-recording");
    let stopButton = document.getElementById("stop-recording");

    startButton.addEventListener("click", function () {
        startRecording();
        this.setAttribute("disabled", "disabled");
        stopButton.removeAttribute('disabled')
    });

    stopButton.addEventListener("click", function () {
        stopRecording();
        this.setAttribute("disabled", "disabled");
        startButton.removeAttribute('disabled')
    });
});
