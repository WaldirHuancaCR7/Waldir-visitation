import React , {Component } from 'react'
import PropTypes from "prop-types";
import axios from "axios";
import './Visits.scss'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

class Visits extends Component {
  state = {
    visits: [],
    search:''
  };
  componentDidMount() {
    this.getVisits()
  }
  getVisits = ()=> {
    axios
      .get(`/api/v1/visits?q=${this.state.search}`)
      .then(res => {
        const newVisits = res.data
        this.setState({
          visits: newVisits
        });
      })
      .catch(err => {
        // console.log(err)
      });
  }
  componentDidUpdate(prevProps, prevState, ) {
    if (prevState.search != this.state.search) {
      this.getVisits();
    }
  }
  
  handleChangeSearch = (e) => {
    if (e.target.value.length > 3) {
      this.setState({
        search: e.target.value
      })
    }
    else(
      this.setState({
        search: ''
      })
    )  
  }

  handleClickOpenVisit = (event, id) => { window.location.assign(`/visits/${id}`) }
  render() {
    return (
      <div className="container ">
        <div className="panel">
          <div className="panel-header">
            <p className="panel-header-title">Estudiantes</p>
          </div>
          <div className="panel-body">
            <div className="row">
              <div className="col-4">
                
                <div className="contentInput ">
                  <input
                    type="text"
                    className="input inputIconContent"
                    placeholder="Buscar"
                    onChange={this.handleChangeSearch.bind(this)}
                  />
                  <FontAwesomeIcon icon="search" className="inputIcon" />
                </div>
              </div>
              {/* <div className="col-3">
                <div className="contentInput ">
                  <label className="label">Por:</label>
                  <input type="text" className="input" placeholder="Todos" />
                </div>
              </div> */}
              <div className="col-4">
                <div className="contentSwicth">
                  <p className="switch  switch-pendient">Pendiente</p>
                  <p className="switch  switch-visited">Visitado</p>
                  <p className="switch  switch-inProcess">En proceso</p>
                  <p className="switch  switch-closed">Cerrado</p>
                </div>
              </div>
            </div>

            <table className="table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Folio</th>
                  <th>Nombre</th>
                  <th>Apellidos</th>
                  <th>Carrera</th>
                  <th>Tipo</th>
                  <th>Estado</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {this.state.visits.map((student, i) => (
                  <tr key={i}>
                    <td>{student.id}</td>
                    <td>{student.folio}</td>
                    <td>{student.person.first_name}</td>
                    <td>{student.person.last_name}</td>
                    <td>{student.professional_school.name}</td>
                    <td>{student.student.student_type}</td>
                    <td className={student.status}>
                      <FontAwesomeIcon icon="circle" className="IconStatus" />
                    </td>
                    <td>
                      <FontAwesomeIcon icon="eye" className="IconEye" onClick={(e) => this.handleClickOpenVisit(e, student.id )}/>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default Visits

  