--Write a script to update the the episode name to {ORIGINAL_EPISODE_NAME}_CANCELLED 
--for only the episodes with zero doctor appearances

UPDATE tblEpisode
set Title=CONCAT(Title,'__CANCELLED')
WHERE DoctorId IS NULL;