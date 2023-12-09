extends RigidBody3D

@export var fall_down_distance = 30
@onready var gpu_particles_3d = $GPUParticles3D
@onready var audio_stream_player_3d = $AudioStreamPlayer3D


var player

func _ready():
	gravity_scale = 0	# Disables gravity initially
	player = get_tree().get_first_node_in_group("player")

# Called every frame; 'delta' is the time since the last frame
func _process(delta):
	var player_z_vector = Vector3(0,0, player.position.z)
	var obstacle_z_vector = Vector3(0, 0, position.z)
	var distance_between = player_z_vector.distance_to(obstacle_z_vector) # Calculates distance between the player and obstacle on Z axis
	if distance_between < fall_down_distance: # If the player is within the fall down distance, enable gravity
		gravity_scale = 1


# Called when a body enters the collision shape
func _on_body_entered(body):
	if body is Floor: # Checks if the body is the Floor
		gpu_particles_3d.emitting = true
		audio_stream_player_3d.play()
