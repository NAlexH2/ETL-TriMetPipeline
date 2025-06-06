text_date() {
    echo "[$(date +"%m-%d-%Y-%H:%M:%S.%N" | cut -c -23)]"
}

if [ ! -d "logs" ]; then
    mkdir logs
fi

echo "$(text_date) DATA COLLECTION AND PUBLISHING START" | tee "logs/MAINLOG-$(date +"%m-%d").log"

git pull | tee -a "logs/MAINLOG-$(date +"%m-%d").log"
echo "$(text_date) git pull complete" | tee -a "logs/MAINLOG-$(date +"%m-%d").log"

pip install -r requirements.txt > /dev/null 2>&1
python part1pub_main.py -G -U -T -P

echo "$(text_date) Stopping python script" | tee -a "logs/MAINLOG-$(date +"%m-%d").log"
