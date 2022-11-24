//
//  main.swift
//  MyCreditManager
//
//  Created by 정준영 on 2022/11/24.
//

import Foundation

let scoreDic = ["A+": 4.5, "A": 4, "B+": 3.5, "B": 3, "C+": 2.5, "C": 2, "D+": 1.5, "D": 1, "F": 0]
var studentInfo: [String: [String: String]] = [:]

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    let input = readLine()!
    
    //학생 추가
    if input == "1" {
        print("추가할 학생의 이름을 입력해주세요")
        let studentName = readLine()
        if studentName != nil {
            if studentInfo.contains(where: { $0.key == studentName! }) {
                print("\(studentName!)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
                continue
            } else {
                studentInfo[studentName!] = [:]
                //print(studentInfo)
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            continue
        }
        
        //학생 삭제
    } else if input == "2" {
        print("삭제할 학생의 이름을 입력해주세요")
        let studentName = readLine()
        if studentName != nil {
            if studentInfo.contains(where: { $0.key == studentName! }) {
                studentInfo[studentName!] = nil
                print("\(studentName!) 학생을 삭제하였습니다.")
                continue
            } else {
                print("\(studentName!) 학생을 찾지 못했습니다.")
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            continue
        }
        
        //성적 추가
    } else if input == "3" {
        print("성적을 추가할 학생의 이름, 과목이름, 성적(A+,A,F등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        let score = readLine()
        let arr = score!.components(separatedBy: " ")
        if arr.count == 3 && scoreDic.contains(where: { $0.key == arr[2]}) {
            studentInfo[arr[0]]![arr[1]] = arr[2]
            print("\(arr[0]) 학생의 \(arr[1]) 과목이 \(arr[2])로 추가(변경)되었습니다.")
            //print(studentInfo)
            continue
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            continue
        }
        
        //성적 삭제
    } else if input == "4" {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
        let score = readLine()
        let arr = score!.components(separatedBy: " ")
        if arr.count == 2 {
            if studentInfo.contains(where: { $0.key == arr[0] }) {
                studentInfo[arr[0]]![arr[1]] = nil
                print("\(arr[0]) 학생의 \(arr[1]) 과목의 성적이 삭제되었습니다.")
                continue
            } else {
                print("\(arr[0]) 학생을 찾지 못했습니다.")
                continue
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            continue
        }
        
        //평점보기
    } else if input == "5" {
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        let studentName = readLine()
        var totalScore: Double = 0
        let subjectCount = Double(studentInfo[studentName!]!.count)
        if studentName != nil {
            if studentInfo.contains(where: { $0.key == studentName! }) {
                for (key, value) in studentInfo[studentName!]! {
                    print("\(key): \(value)")
                    totalScore += scoreDic[value]!
                }
                //print("토탈점수: \(totalScore)")
                //print("카운트: \(subjectCount)")
                print("평점 : \(String(format: "%.2f", totalScore / subjectCount))")
                continue
            } else {
                print("\(studentName!) 학생을 찾지 못했습니다.")
            }
        } else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            continue
        }
        
        //종료
    } else if input == "X" {
        print("프로그램을 종료합니다...")
        break
    } else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요")
        continue
    }
}
