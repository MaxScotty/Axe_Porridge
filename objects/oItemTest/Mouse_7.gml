dragged = false;

//mask_index = sKettleTest

if (instance_position(oKettleTest.x, oKettleTest.y, oItemTest))
{
	instance_create_layer(763, 95, "Instances", oItemTestCut);
	instance_deactivate_object(oItemTest)
}