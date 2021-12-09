const quiz = [
  {
    question: '地域により異なりますが、一般的に米の収穫時期はいつでしょう？',
    answers: [ '春', '夏', '秋', '冬'],
    correct: '秋'
  }, {
    question: '新規就農者支援制度の補助金を受給しやすい人は誰でしょう？',
    answers: [ '50歳ですが農業に強い関心を持ち、やる気に満ちています！', '認定農家として農業を始めて5年になります！', '農業の知識はないですが経理などの事務経験があり、役所に親戚がいます！', '生活保護を受けていますが農業を親から継ぎ、起業したいです！'],
    correct: '農業の知識はないですが経理などの事務経験があり、役所に親戚がいます！'
  }, {
    question: '種無しぶどうの作り方は？',
    answers: [ 'ジベレリン液に浸す', '品種によって決まっている', '雄の木のみ種はできない', '剪定・芽かき時期にセーフライトを当てる'],
    correct: 'ジベレリン液に浸す'
  }, {
    question: 'ファイナルファンタジーⅣの主人公の名前は？',
    answers: [ 'フリオニール', 'クラウド', 'ティーダ', 'セシル'],
    correct: 'セシル'
  }, {
    question: 'ファイナルファンタジーⅣの主人公の名前は？',
    answers: [ 'フリオニール', 'クラウド', 'ティーダ', 'セシル'],
    correct: 'セシル'
  },
];

const $window = window;
const $doc = document;
const $question = $doc.getElementById('js-question');
const $buttons = $doc.querySelectorAll('.btn');

const quizLen = quiz.length;
let quizCount = 0;
let score = 0;

const init = () => {
  $question.textContent = quiz[quizCount].question;

  const buttonLen = $buttons.length;
  let btnIndex = 0;

  while(btnIndex < buttonLen){
    $buttons[btnIndex].textContent = quiz[quizCount].answers[btnIndex];
    btnIndex++;
  }
};

const goToNext = () => {
  quizCount++;
  if(quizCount < quizLen){
    init(quizCount);
  } else {
    // $window.alert('クイズ終了！');
    showEnd();
  }
};

const judge = (elm) => {
  if(elm.textContent === quiz[quizCount].correct){
    $window.alert('正解!');
    score++;
  } else {
    $window.alert('不正解!');
  }
  goToNext();
};

const showEnd = () => {
  $question.textContent = '終了！あなたのスコアは' + score + '/' + quizLen + 'です';

  const $items = $doc.getElementById('js-items');
  $items.style.visibility = 'hidden';
};

init();

let answersIndex = 0;
let answersLen = quiz[quizCount].answers.length;

while(answersIndex < answersLen){
  $buttons[answersIndex].addEventListener('click', (e) => {
    judge(e.target);
  });
  answersIndex++;
}