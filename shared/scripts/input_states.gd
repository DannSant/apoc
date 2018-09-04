### class for input handling. Returns 4 button states
var input_name
var prev_state
var current_state = false
var input

var output_state
var state_old

### Get the input name and store it
func _init(var input_name):
	self.input_name = input_name
	
### check the input and compare it with previous states
func check():
	input = Input.is_action_pressed(self.input_name)
	prev_state = current_state
	current_state = input
	
	state_old = output_state
	
	if not prev_state and not current_state:
		output_state = 0 ### Released
	if not prev_state and current_state:
		output_state = 1 ### Just Pressed
	if prev_state and current_state:
		output_state = 2 ### Pressed
	if prev_state and not current_state:
		output_state = 3 ### Just Released

	if state_old==3:
		return state_old
	else:
		return output_state

func check_debug():
	var state = check()
	print(str(prev_state) + ", " + str(current_state) + ", " + str(state_old) + "," + str(output_state))
	
	return state
	
func get_input():
	return input

func print_states():
	print(str(prev_state) + ", " + str(current_state) + ", " + str(state_old) + "," + str(output_state))
	