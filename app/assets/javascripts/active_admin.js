//= require active_admin/base
//= require active_admin_datetimepicker
const profile = document.getElementById('profile')
const contentProfile = document.getElementById('contentProfile')

profile.addEventListener('click', OpenOptionsProfile(() => {
  contentProfile.classList.add("openContentProfile")
})
)


