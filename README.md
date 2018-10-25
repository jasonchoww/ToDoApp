# ToDoApp

Created by Jason Chow on 10/17/18.
Copyright © 2018 Jason Chow. All rights reserved.

This application is a to do application. The to do application allow users to keep track of their tasks throughout the day.
The application features: add task, complete task, edit task, and trash task.

*   The application saves all information even if the application is closed
**  Running the unit tests will clear user data for testing purposes

Explanation and instructions for the application features below:
1. Adding a Task
    A user can add a task by using the text field on the top.
    After text is added, the user presses "+ ADD TASK"
    The task is now apart of the list that is scrollable
  
2. Completing a Task
    To complete a task, the user can swipe left on any task on the UIViewTable
    Swiping left will populate three actions [Complete, Edit, Trash]
    Press "Complete"
    The task in the UIViewTable will now show up with a green box check mark indicating the task is complete
    
3. Editing a Task
    To edit a task, the user can swipe left on any task on the UIViewTable
    Swiping left will populate three actions [Complete, Edit, Trash]
    Press "Edit"
    An alert should pop up, the user can input a task to rename the previous task
    Press "Accept", *(Press "Cancel" -> will cancel the edit)
    The task in the UIViewTable will now show up with the newly named task   
    
4. Trashing a Task
    To complete a task, the user can swipe left on any task on the UIViewTable
    Swiping left will populate three actions [Complete, Edit, Trash]
    Press "Trash"
    The task in the UIViewTable will no longer exist
    
The To Do Application also includes four unit tests that will be described below:
UNIT TESTS
    All unit testings will be located in the todoAppUITests
    The tests will test for adding a task, completing a task, editing a task, and trashing a task
    To run the unit test, on the top menu:
        Product -> Test
   
   Under the swift files for the individual tests, the "testExample()" will be used to tests the four features of the To Do App
   
        
