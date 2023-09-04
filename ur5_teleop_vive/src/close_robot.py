import URBasic

ROBOT_IP = '10.75.15.194'
robotModel = URBasic.robotModel.RobotModel()
robot = URBasic.urScriptExt.UrScriptExt(host=ROBOT_IP,robotModel=robotModel)

# robot.close()

print("Closed robot connection successfully")