function cal_highlight
    cal | grep --color -EC6 "\b"(date +%e | sed "s/ //g")
end
