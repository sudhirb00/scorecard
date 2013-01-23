@establishments = Establishment.all
est_without_images = 0
est_with_images = 0
@establishments.each { |est|
media = Media.where("est_id = #{est.est_id} and est_flag = 'est'   ")
if (media.nil? or media.size == 0) then
  p "No media exists for #{est.est_id}"
  est_without_images += 1
else
  p "#{media.size} media exists for #{est.est_id}"
  est_with_images += 1
end

}

p "total est without images #{est_without_images}"
p "total est with images #{est_with_images}"

