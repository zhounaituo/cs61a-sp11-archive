#!/bin/bash

# download_files.sh 1.1 "plural2.scm,plural1.scm"

dir="../resources/lectures"

download_files() {
    # 接受两个参数，第一个是文件列表，第二个是目标目录
    source_dir=$1
    files=$2
    target_dir="${dir}/${source_dir}"

    # 基本URL
    base_url="https://people.eecs.berkeley.edu/~bh/61a-pages/Lectures/${source_dir}/"

    # 将文件列表转换为数组
    IFS=',' read -ra file_array <<< "$files"

    # 检查目标目录是否存在，如果不存在则创建
    if [ ! -d "$target_dir" ]; then
        mkdir -p "$target_dir"
    fi

    # 循环下载文件并保存到目标目录
    for file in "${file_array[@]}"; do
        curl -o "${target_dir}/${file}" "${base_url}${file}"
    done
}

# 调用函数下载文件
#download_files "2.1" "calc.scm,cons.scm,mapreduce.scm,total.scm"
#download_files "2.2" "bst.scm,bst2.scm,music.scm,print.scm,search.scm,sentence.scm,squares.scm,tdisp.scm,tiny.scm,tree.scm,tree1.scm,tree2.scm,tree3.scm,tree11.scm,tree22.scm,world.scm"
#download_files "2.4" "bnf,data.scm,geom.scm,msg.scm,trydata.scm,type.scm"
#download_files "3.0" "count.scm,demo.scm,demo2.scm"
#download_files "3.1" "count-oop.scm,count.lose,count.scm,count1.scm,count2.scm,count3.scm,prev.scm,prev1.scm,prev2.scm,prev3.scm"
#download_files "3.2" "count4.scm,count5.scm,count6.scm,env-note,envrules,obj.scm,prev4.scm,prev5.scm,prev6.scm"
#download_files "3.3" "animal.scm,append.scm,constraint.scm,fib.scm,insert.scm,table.scm,why-a-header"
#download_files "3.4" "bad-serial.scm,dining.scm"
#download_files "3.5" "fib.scm,ints-from,prime0.scm,prime1.scm,prime2.scm,show-stream.scm,sieve.scm,stream-memo.scm,stream-pack.scm,stream0.scm,stream1.scm,stream2.scm,streamstate.scm,why-streams"
#download_files "4.1" "altern.syntax,bug.logo,demo.logo,micro.scm,summary-of-course"
#download_files "4.2" "old-MCE-questions,old-MCE-solutions,pairs.scm,while.scm"
#download_files "4.4" "append.scm,dcg.scm,family.scm,isa.scm,lex-vs-dynam,logic-examp.scm,logic-utility.scm,reverse.scm,trace"
#download_files "Net" "stk-sockets"
#download_files "unix" "spell,steps,words"
download_files "" "errors,groupreduces.scm,mapreduce-demo.scm,summary"
