//
// MaxRun.swift
//
// created by Ketia Gaelle Kaze
// created on 2022-04-10
// version 1.0
// Copyright (c) Ketia Gaelle Kaze. ALl rights reserved.
// String stuff program reads user input from
// a txt file that has strings in it and then
// it returns the largest run in the string and
// displays the result in an output txt file.
//

import Foundation
// function for the max run
func maxRun (string: String) -> Int {
  // declare variables
  var count: Int = 1
  var maxRun: Int
  let stringArray: [Character] = Array(string)
  if string.count >= 1 {
    maxRun = 1
    for charCount in 1..<stringArray.count {
      if stringArray[charCount] == stringArray[charCount - 1] {
        count += 1
        if count > maxRun {
          maxRun = count
        }
      } else {
        count = 1
      }
    }
  } else {
    maxRun = 0
  }
  return maxRun
}
// declaring constants and variables
let userInput = "/home/runner/Assign-02-Swift/input.txt"
var result: Int
var resultSentence: String
var resultStrings: String = ""
var text: String = ""
var arrayToString: String
let resultStringsArray: [String]

// read user input file into an array
let listOfStrings: String = try String(contentsOfFile: userInput)
let arrayOfStrings: [String] = listOfStrings.components(separatedBy: "\n")
// call function
for counter1 in 0..<arrayOfStrings.count {
  result = maxRun(string: arrayOfStrings[counter1])
  resultSentence = "The max run of " + arrayOfStrings[counter1] + " is " + String(result) + "\n"
  resultStrings.append(resultSentence)
}
// convert the result array to another array
resultStringsArray = resultStrings.components(separatedBy: "\n")
// write the result to the output file
try text.write(to: URL(fileURLWithPath: "/home/runner/Assign-02-Swift/output.txt"), atomically: false, encoding: .utf8)

if let fileWriter = try? FileHandle(forUpdating: URL(fileURLWithPath: "/home/runner/Assign-02-Swift/output.txt")) {
  // add each string to the output file
  for counter2 in 0..<resultStringsArray.count {
    if counter2 != resultStringsArray.count-1 {
      arrayToString = resultStringsArray[counter2] + "\n"
    } else {
      arrayToString = resultStringsArray[counter2]
    }
    fileWriter.seekToEndOfFile()
    fileWriter.write(arrayToString.data(using: .utf8)!)
  }
  fileWriter.closeFile()
}
print("Assigned the result to the output file.")
