# 足し算コマンドの仕様書
# ＝＝＝＝＝＝＝＝＝＝＝
# コマンド $1 $2 $3
# $1->桁数
# $2->問題数(何口)
# $3->待機時間
# ＝＝＝＝＝＝＝＝＝＝＝

# 環境設定のコード
case "$#" in
  0) digit=2
     qty=5
     latency=0
  ;;
  1) digit=$1
     qty=5
     latency=0
  ;;
  2) digit=$1
     qty=$2
     latency=0
  ;;
  3) digit=$1
     qty=$2
     latency=$3
  ;;
  *) echo "オプションを確認してください"
     exit
  ;;
esac
min=$((10**($digit-1)))
max=$((10**($digit)-1))
str1="円なり"
str2="合わせて"
sum=0

#プログラムの実行コード
echo "ご破産で願いましては!"
say "ゴハサンデネガイマシテワ"
for ((i=1; i<=$qty; i++))
do
  dice=$(seq $min $max| shuf| head -n 1)
  echo "$dice$str1"
  say "$dice$str1"
  sum=$(($dice+$sum))
  sleep $latency
done
echo $str2$sum$str1
say $str2$sum$str1
