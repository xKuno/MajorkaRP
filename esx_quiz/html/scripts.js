// question variables
var questionNumber = 1;
var userAnswer = [];
var goodAnswer = [];
var questionUsed = [];
var nbQuestionToAnswer = 21; // don't forget to change the progress bar max value in html
var nbAnswerNeeded = 15; // out of nbQuestionToAnswer
var nbPossibleQuestions = 21; // number of questions in database questions.js
var lastClick = 0;
var pytania = [
	{
		question: "Czy można porwać medyka, który jest w trakcie ratowania innej osoby?",
		propositionA: "Tak",
		propositionB: "Tak,ale tylko wtedy, jak medyk byl wulgarny",
		propositionC: "Nie",
		propositionD: "Żadna z odpowiedzi nie jest poprawna",
		reponse: "C"
	},

	{
		question: "Czy zoobowiązujesz się przestrzegać regulaminu, który jest dostępny na naszym discordzie?",
		propositionA: "Tak",
		propositionB: "Nie",
		propositionC: "Zależy",
		propositionD: "Wszystkie odpowiedzi sa poprawne",
		reponse: "A"
	},

	{
		question: "Co to jest Metagaming?",
		propositionA: "Wnoszenie informacji z OOC do IC",
		propositionB: "Specjalne potrącenie innych osób",
		propositionC: "Rozmowa na discordzie",
		propositionD: "Żadna z odpowiedzi nie jest poprawna",
		reponse: "A"
	},

	{
		question: "Jakie operatory obowiązuja u nas na wyspie?",
		propositionA: "/do, /me, /try, ",
		propositionB: "/dark, /twt",
		propositionC: "/twt, /dark, /ems, /lspd",
		propositionD: "/revive, /die",
		reponse: "A"
	},

	{
		question: "Czy mozesz jezdzic pojadzem bez 4 opon?",
		propositionA: "Tak",
		propositionB: "Nie",
		propositionC: "Co to za roznica",
		propositionD: "Nie wiem",
		reponse: "B"
	},

	{
		question: "Co to jest mustwin?",
		propositionA: "Źle wykonana akcja RP",
		propositionB: "Dążenie tylko i wyłącznie do wygranej.",
		propositionC: "Akcja, którą wygrales",
		propositionD: "Wyzwiska i wychodzenie z postaci",
		reponse: "B"
	},

	{
		question: "Co to jest DriveThru?",
		propositionA: "Strzelanie z auta jako KIEROWCA",
		propositionB: "Przejeżdzanie obywateli",
		propositionC: "Ucieczka przed policją",
		propositionD: "Żadna z odpowiedzi, nie jest poprawna",
		reponse: "D"
	},

	{
		question: "Co to jest EXPLOITING??",
		propositionA: "Zwiedzanie terenu",
		propositionB: "Wykorzystywanie błędów gry, w celu zdobycia przewagi.",
		propositionC: "Włamanie na posesje",
		propositionD: "Włamanie na komisariat",
		reponse: "B"
	},

	{
		question: "Kiedy negocjator policyjny traci swój immunited?",
		propositionA: "Gdy przyjmie łapówke",
		propositionB: "Gdy użyje radia bez zgody napastników",
		propositionC: "Gdy użyje broni",
		propositionD: "B i C to poprawane odpowiedzi",
		reponse: "D"
	},
	
	{
		question: "Masz sprawę do admina w grze, gdzie go o tym poinformujesz?",
		propositionA: "Na /ooc",
		propositionB: "Na discordzie",
		propositionC: "Na /report",
		propositionD: "Odpowiedzi B i C są poprawne",
		reponse: "D"
	},

	{
		question: "Co to jest LootRP?",
		propositionA: "Szukanie policji, żeby ją sprowokować",
		propositionB: "Jest to rozpoczecie akcji RP tylko wyłącznie dla zdobycia rzeczy z obywatela",
		propositionC: "Porwanie innej osoby",
		propositionD: "Szukanie skarbów",
		reponse: "B"
	},

	{
		question: "Co to jest Brutally Wounded?",
		propositionA: "Zabicie kogoś",
		propositionB: "Poważne zranienie postaci",
		propositionC: "Akcja z użyciem BrutalRP",
		propositionD: "Strzelanie do lokalnych",
		reponse: "B"
		
	},	
	
	{
		question: "Czy organizacje porządkowe mają prawo do wykonywania power gamingu?",
		propositionA: "Nie",
		propositionB: "Może",
		propositionC: "Kto wie",
		propositionD: "Tak",
		reponse: "D"
		
	},
	
	{
		question: "Od ilu dostępnych LSPD może być wykonany napad na sklep?",
		propositionA: "3",
		propositionB: "1",
		propositionC: "2",
		propositionD: "4",
		reponse: "C"
		
	},
	
	{
		question: "Co to jest amnezja?",
		propositionA: "Jest to utracenie pamięci",
		propositionB: "Rodzaj ciasta",
		propositionC: "Marka auta",
		propositionD: "Nazwisko szefa Policji",
		reponse: "A"
		
	},

	{
		question: "Kiedy możemy wykonać BrutalRP?",
		propositionA: "Przy porwaniu",
		propositionB: "Za zgodą Zarządu serwera",
		propositionC: "Przy wykonywaniu CK",
		propositionD: "Odpowiedzi B i C są prawidłowe",
		reponse: "D"
		
	},
	
	{
		question: "Czy administrator ma prawo zbanować kogoś, za punkt którego nie ma w regulaminie?",
		propositionA: "Nie.",
		propositionB: "Tak, jeśli uważa go za słuszny.",
		propositionC: "Tak, po uzgodnieniu go z Project Leaderem.",
		propositionD: "Raz w tygodniu.",
		reponse: "B"
		
	},
	
	
	{
		question: "Czy możesz użyc operatora /try na graczu?",
		propositionA: "Tak.",
		propositionB: "Może.",
		propositionC: "Nie, ponieważ jest to powergaming.",
		propositionD: "Tak, ale tylko za zgodą admina.",
		reponse: "C"
		
	},
	
	{
		question: "Zostałeś porwany przez 4 gangsterów, jeden z nich nie miał na sobie maski. Zostałeś okradziony oraz postrzelony co spowodowało, że odrodziłeś się w szpitalu. Po wyjściu z niego chcesz znaleźć tą osobę i się zemścić, możesz to zrobić?",
		propositionA: "Tak mogę, bo znam jego twarz.",
		propositionB: "Nie, ponieważ mam amnezje.",
		propositionC: "Nie wiem.",
		propositionD: "Chyba tak.",
		reponse: "B"
		
	},
	
	{
		question: "Czy obywatel niepracujący w EMS, może posiadać przy sobie bandaże??",
        propositionA: "Nie może, jest to surowo zabronione",
        propositionB: "Tak może posiadać",
        propositionC: "Nie wiem",
        propositionD: "Co to za różnica",
        reponse: "A"
		
	},
	
	{
		question: "Co to jest akcja hostylna?",
		propositionA: "Akcja o podłożu Crime",
		propositionB: "Akcje o podłożu neutralnym",
		propositionC: "Odbicia zakładnika",
		propositionD: "Akcja agresywna np. wyzywanie medyka za to że nie chce pomóc naszemu koledze",
		reponse: "A"
	},
	
	{
		question: "Co to jest immersja",
		propositionA: "Posiadanie imienia znanej osoby",
		propositionB: "Akcja o podłożu Crime",
		propositionC: "Poważne zranienie postaci",
		propositionD: "Realistyczne odbicie prawdziwego życia w grze",
		reponse: "D"
	},
	
	{
		question: "Czy możemy wziąć więcej osób do samochodu, niż jest w nim miejsc?",
		propositionA: "Tak",
		propositionB: "Tak możemy na kolankach",
		propositionC: "Tylko jeśli ktoś ma BW",
		propositionD: "Nie",
		reponse: "C"
	},
	
	{
		question: "Do czego służy czat LOOC?",
		propositionA: "Do pogaduszek",
		propositionB: "Do poinformowania o błędzie lub o rządowym",
		propositionC: "Do wyzwisk",
		propositionD: "Do wytykania błędów innej osoby",
		reponse: "B"
	},
	
	{
		question: "Ile osób może uczestniczyć w danej akcji?",
		propositionA: "10 ze strony LSPD oraz Crime",
		propositionB: "Bez limitu ze strony LSPD, a 10 ze strony crime",
		propositionC: "7 ze strony LSPD oraz Crime",
		propositionD: "12 ze strony LSPD oraz Crime",
		reponse: "A"
	},
	
	{
		question: "Czy po odrodzeniu w szpitalu pamiętamy co doprowadziło nas do szpitala?",
		propositionA: "Tak.",
		propositionB: "Nie.",
		propositionC: "Nie wiem.",
		propositionD: "Jeśli byliśmy na neutralnej strefie.",
		reponse: "A"
	},
	
	{
		question: "Czy możemy podszyć się pod organizacje publiczne?",
		propositionA: "Tak jeżeli posiadamy mocny wątek RP",
		propositionB: "Nie, jest to surowo zabronione",
		propositionC: "Tak",
		propositionD: "Jestem gejem",
		reponse: "A"
	},
	
	{
		question: "Czy możemy wezwać LSPD, a potem ich porwać?",
		propositionA: "Tak, czemu nie?",
		propositionB: "Nie, jest to zakazane.",
		propositionC: "Tak, przecież potrzebuje zakladników",
		propositionD: "nie wiem",
		reponse: "B"
	},
	
	{
		question: "Czy EMS posiada Immunited?",
		propositionA: "Nie tylko w określonych sytuacjach",
		propositionB: "Tak w każdym wypadku",
		propositionC: "nie wiem",
		propositionD: "Zależy",
		reponse: "A"
	},
	
	{
		question: "Od ilu F.P możemy wykonać napad na Jacht?",
		propositionA: "od 7",
		propositionB: "Od 6",
		propositionC: "Od 4",
		propositionD: "Od 5",
		reponse: "B"
	},
	
	{
		question: "Czy osoba porwana ma obowiązek wyjawnić tajne informacje?",
		propositionA: "Nie",
		propositionB: "Tak, inaczej nie szanuje swojego życia",
		propositionC: "Chyba",
		propositionD: "A nie wiem",
		reponse: "A"
	},
	
	{
		question: "Czy odbicie konwoju to akcja hostylna?",
		propositionA: "Nie",
		propositionB: "Tak",
		propositionC: "Kto wie",
		propositionD: "Żadna z odpowiedzi nie jest prawidłowa",
		reponse: "B"
	},
	
	{
		question: "Czy możesz nazywać sie Harry Potter, główny bohater serii Harry Potter",
		propositionA: "Nie",
		propositionB: "Za zgodą administracji",
		propositionC: "Tak",
		propositionD: "Mam małego penisa",
		reponse: "C"
	},
	
	{
		question: "Co to jest amnezja?",
		propositionA: "Jest to utracenie pamięci",
		propositionB: "Rodzaj ciasta",
		propositionC: "Marka auta",
		propositionD: "Jest to darowanie lub złagodzenie środków karnych za popełnione przestępstwo",
		reponse: "A"
	},
	
	{
		question: "Czy w strefie neutralnej możemy porwać obywatela?",
		propositionA: "Tak zawsze",
		propositionB: "Tak jeżeli posiadamy odpowiedni powód",
		propositionC: "Nie",
		propositionD: "Żadna z odpowiedzi nie jest poprawna",
		reponse: "B"
	},
	
	{
		question: "Od ilu F.P możemy wykonać napad na Bank Główny Pacific Standard?",
		propositionA: "Od 7.",
		propositionB: "od 4.",
		propositionC: "Od 6.",
		propositionD: "od 5.",
		reponse: "D"
	},
	
	{
		question: "Po jakim czasie możemy wejść do swojego mieszkania, od zrobienia napadu?",
		propositionA: "Po piętnastu minutach.",
		propositionB: "Po dziesięciu minutach.",
		propositionC: "Żadna odpowiedź nie jest poprawna.",
		propositionD: "Po dwudziestupięciu minutach.",
		reponse: "A"
	},
	
	{
		question: "Czy możemy odegrać brak posiadania dowodu?",
		propositionA: "Tak",
		propositionB: "Nie",
		propositionC: "Tylko jeśli odegram.",
		propositionD: "Tylko jeśli porwą mnie gangsterzy.",
		reponse: "B"
	},
	
	{
		question: "Czy EMS może wspólpracować z crime?",
		propositionA: "Nie",
		propositionB: "Tak",
		propositionC: "Tylko za zgodą Zarządu serwera",
		propositionD: "Żadna z odpowiedzi nie jest prawidłowa",
		reponse: "B"
	},
	
	{
		question: "Czy możesz posiadać w swoim ekwipunku radio-frakcyjne?",
		propositionA: "A co to za różnica?",
		propositionB: "Tak",
		propositionC: "Nie, chyba że należymy do frakcji",
		propositionD: "Żadna z odpowiedzi nie jest prawidłowa",
		reponse: "C"
	},
	
	{
		question: "Czy możemy rozpoznać osobę zamaskowaną po głosie?",
		propositionA: "Nie wiem",
		propositionB: "Nie, bo ma maskę",
		propositionC: "Tak",
		propositionD: "Żadna z odpowiedzi nie jest prawidłowa",
		reponse: "C"
	},
	
	{
		question: "Czy możemy wejść do auta będąc zakutym?",
		propositionA: "Nie",
		propositionB: "Tak, jak jesteśmy zakuci od przodu",
		propositionC: "Tak, ale tylko wtedy, jak wcześniej inna osoba odegra, że pomaga ci wsiąść",
		propositionD: "Żadna z odpowiedzi nie jest prawidłowa",
		reponse: "C"
	},
]

function getRandomQuestion() {
	var random = Math.floor(Math.random() * nbPossibleQuestions)

	while (true) {
		if (questionUsed.indexOf(random) === -1) {
			break
		}

		random = Math.floor(Math.random() * nbPossibleQuestions)
	}

	questionUsed.push(random)

	return random
}

// Partial Functions
function closeMain() {
	$(".home").css("display", "none");
}
function openMain() {
	$(".home").css("display", "block");
}
function closeAll() {
	$(".body").css("display", "none");
}

function openQuestionnaire() {
	$(".questionnaire-container").css("display", "block");
	var randomQuestion = getRandomQuestion();

	$("#questionNumero").html("Pytanie: " + questionNumber);
	$("#question").html(pytania[randomQuestion].question);
	$(".answerA").html(pytania[randomQuestion].propositionA);
	$(".answerB").html(pytania[randomQuestion].propositionB);
	$(".answerC").html(pytania[randomQuestion].propositionC);
	$(".answerD").html(pytania[randomQuestion].propositionD);
	$('input[name=question]').attr('checked', false);

	goodAnswer.push(pytania[randomQuestion].reponse);
	$(".questionnaire-container .progression").val(questionNumber - 1);
}
function openResultGood() {
	$(".resultGood").css("display", "block");
}
function openResultBad() {
	$(".resultBad").css("display", "block");
}
function openContainer() {
	$(".question-container").css("display", "block");
}
function closeContainer() {
	$(".question-container").css("display", "none");
}

// Listen for NUI Events
window.addEventListener('message', function (event) {
	var item = event.data;

	// Open & Close main window
	if (item.openQuestion == true) {
		openContainer();
		openMain();
	}

	if (item.openQuestion == false) {
		closeContainer();
		closeMain();
	}

	// Open sub-windows / partials
	if (item.openSection == "question") {
		closeAll();
		openQuestionnaire();
	}
});

// Handle Button Presses
$(".btnQuestion").click(function () {
	$.post('http://esx_quiz/question', JSON.stringify({}));
});

$(".btnClose").click(function () {
	$.post('http://esx_quiz/close', JSON.stringify({}));
});

$(".btnKick").click(function () {
	$.post('http://esx_quiz/kick', JSON.stringify({}));
});

$(".nextQuest").click(function (e) {
	e.preventDefault();

	if (questionNumber != nbQuestionToAnswer) {
		//question 1 to 9: pushing answer in array
		closeAll();
		userAnswer.push($('input[name="question"]:checked').val());
		questionNumber++;
		openQuestionnaire();
	} else {
		// question 10: comparing arrays and sending number of good answers
		userAnswer.push($('input[name="question"]:checked').val());
		var nbGoodAnswer = 0;
		for (i = 0; i < nbQuestionToAnswer; i++) {
			if (userAnswer[i] == goodAnswer[i]) {
				nbGoodAnswer++;
			}
		}

		closeAll();
		if (nbGoodAnswer >= nbAnswerNeeded) {
			openResultGood();
		} else {
			openResultBad();
		}
	}

	return false;
});

// Handle Form Submits
$("#question-form").submit(function (e) {
	e.preventDefault();

	if (questionNumber != nbQuestionToAnswer) {
		//question 1 to 9: pushing answer in array
		closeAll();
		userAnswer.push($('input[name="question"]:checked').val());
		questionNumber++;
		openQuestionnaire();
	} else {
		// question 10: comparing arrays and sending number of good answers
		userAnswer.push($('input[name="question"]:checked').val());
		var nbGoodAnswer = 0;
		for (i = 0; i < nbQuestionToAnswer; i++) {
			if (userAnswer[i] == goodAnswer[i]) {
				nbGoodAnswer++;
			}
		}

		closeAll();
		if (nbGoodAnswer >= nbAnswerNeeded) {
			openResultGood();
		} else {
			openResultBad();
		}
	}

	return false;
});
