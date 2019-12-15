//
//  File.swift
//  day10TODoListSqlite
//
//  Created by Student 06 on 28/11/19.
//  Copyright © 2019 Student 06. All rights reserved.
//

import Foundation
import SQLite3
class DBWrapper
{
    static let sharedObj = DBWrapper()
    var db:OpaquePointer?
    var stmt:OpaquePointer?
    func getDataBasePath()->String
    {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = dir.first!
        return path + "myDatabase.Sqlite"
    }
    func executeQuery(query:String)->Bool
    {
        var success = false
        let databasePath = getDataBasePath()
        if sqlite3_open(databasePath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
                if sqlite3_step(stmt) == SQLITE_DONE
                {
                    success = true
                    sqlite3_close(db!)
                    sqlite3_finalize(stmt!)
                }
            }
            else
            {
                print("Error in prepare V2:\(sqlite3_errmsg(db))")
            }
        
        }
        else
        {
            print("Error in opning:\(sqlite3_errmsg(db))")
        }
      return success
    }
    
    func selectAllTask(query:String)
    {
        var taskIdArray = [String]()
        var taskNameArray = [String]()
        let databasePath = getDataBasePath()
        if sqlite3_open(databasePath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
              while sqlite3_step(stmt) == SQLITE_ROW
                {
                  let taskId =  sqlite3_column_text(stmt, 0)
                    let tId = String(cString: taskId!)
                    taskIdArray.append(tId)
                    let taskName = sqlite3_column_text(stmt, 1)
                    let tName = String(cString: taskName!)
                    taskNameArray.append(tName)
                    
                }
                print("Id Array = \(taskIdArray) and Name Array = \(taskNameArray)")
            }
            else
            {
                print("Error in prepare V2:\(sqlite3_errmsg(db))")
            }
            
        }
        else
        {
            print("Error in opning:\(sqlite3_errmsg(db))")
        }
  
    }
    
    
    
    
    func createTable()
    {
        let createQuery = "create table if not exists taskTable(taskId text,taskName text)"
        let isSuccess = executeQuery(query: createQuery)
        if isSuccess
        {
            print("Table creation:Success")
        }
        else
        {
            print("Table creation:Failed")
        }
    }
    
    
    
    
}
