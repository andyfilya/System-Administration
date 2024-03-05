#!/bin/sh

export DATE=$(date)
export HOST=$(hostname)

echo "Добро пожаловать на компьютер: $HOST, $LOGNAME"
echo "Ваш домашний каталог $HOME"
echo "Ваш командный интерпретатор $SHELL"
echo "Сейчас на комьпютере выставлена дата $DATE"

