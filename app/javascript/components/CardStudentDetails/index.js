import React from 'react'
import './styles.scss'

export const CardStudentDetails = ({ visit, onClickPanel} ) => {

  const img = visit.person.first_name.charAt(0)
  console.log(img);
  
  return(
    <div className="panel PanelClick" onClick={onClickPanel}>
      <div className='visit'>
        <div className='visit-photo'>
          {visit.student.photo == undefined && visit.person.first_name.charAt(0) + visit.person.last_name.charAt(0)}
          {visit.student.photo && <img src={visit.student.photo} alt="" />}
          
        </div>
        <div className='visit-personal'>
          <p className='visit-personal-fullName'>{visit.person.first_name} {visit.person.last_name}</p>
          <div className='visit-personal-item'>
            <p className='visit-personal-item-otherData'>{visit.person.phone}</p>
            <i className="fas fa-phone visit-personal-item-phone"></i>
          </div>
          <div className='visit-personal-item'>
            <p className='visit-personal-item-otherData'> {visit.student.address}</p>
            <i className="fas fa-map-marker-alt visit-personal-item-ubication"></i>
          </div>
        </div>
        <div className="contentSwicth visitContentSwicth">
          {visit.status === 'pendient' && <p className="switch  switch-pendient">Pendiente</p>}
          {visit.status === 'in_process' && <p className="switch  switch-in_process">En Proceso</p>}
          {visit.status === 'visited' && <p className="switch  switch-visited">Visitado</p>}
          {visit.status === 'closed' && <p className="switch  switch-closed">Cerrado</p>}
        </div>
      </div>
      <div className='contentTexts'>
        <li>{visit.professional_school.name}</li>
        <li>{visit.student.student_type}</li>
        <li>{visit.student.reference}</li>
        <li>{visit.person.dni}</li>
      </div>
    </div>
  )
}
export default CardStudentDetails