rm date.pl
touch date.pl

count=1

for month in {1..12}
do
    case $month in 
	1|3|5|7|8|10|12)
        for j in {1..31}
        do
	    echo "date($count, $month, $j)." >> date.pl
	    count=`expr $count + 1`
        done
        ;;

        4|6|9|11)
        for j in {1..30}
        do
	    echo "date($count, $month, $j)." >> date.pl
	    count=`expr $count + 1`
        done
	;;

	2)
        for j in {1..28}
        do
            echo "date($count, $month, $j)." >> date.pl
            count=`expr $count + 1`
        done
	;;
    esac
        
done
