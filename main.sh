case "$#" in
  2) loop=$2
     wait_time=1
  ;;
  3) loop=$2
     wait_time=$3
  ;;
  *) loop=5
     wait_time=1
esac

help(){
  echo 'そろばん練習用のコマンドです。\n$1のオプション一覧\n足し算:-p\n掛け算:-m\n割り算:-d\nヘルプ:-h\n$2のオプションでは問題数を指定します。\n例:./main.sh -p 10→足し算練習を10口で開始\n*$2を選択しないとデフォルトの5口になります'
}
plus(){
  sum=0
  sentence_1="円なり"
  sentence_2="合わせて"
  echo "御破算で願いましては"
  say "ごはさんでねがいましては"
  for i in `seq 1 $loop`
  do
    dice=$((RANDOM%100+1))
    echo $dice$sentence_1
    say $dice$sentence_1
    sleep $wait_time
    sum=$(($sum+$dice))
  done
  echo "答えを入力"
  read answer
  if test $answer -eq $sum ; then
    echo "御明算"
    say "ごめいさん"
  else
    echo "不正解"
    echo "$sentence_2$sum$sentence_1"
    say "$sentence_2$sum$sentence_1"
  fi
}
multiplier(){
  echo "掛け算の関数が呼び出されました!"
}
abteilung(){
  echo "割り算の関数が呼び出されました!"
}
case "$1" in
    "-p") plus
    ;;
    "-m") multiplier
    ;;
    "-d") abteilung
    ;;
    "-h") help
    ;;
    "") help
    ;;
    *) echo "該当のオプションはありません"
    ;;
esac
