import React, { Component } from 'react'
import PropTypes from "prop-types";
import axios from "axios";
import './Students.scss'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

class Students extends Component {
  state = {
    students: [],
    search:''
  }
  componentDidMount() {
    this.getStudents()
  }

  getStudents = () => {
    axios
      .get(`/api/v1/students?q=${this.state.search}`)
      .then(res => {
        const students = res.data
        this.setState({
          students: students
        });
      })
      .catch(err => {
        // console.log(err)
      });
  }
  componentDidUpdate(prevProps, prevState, ) {
    if (prevState.search !== this.state.search) {
      this.getStudents()
    }
  }

  handleChangeSearch = (e) => {
    if (e.target.value.length > 3) {
      this.setState({
        search: e.target.value
      })
    }
    else (
      this.setState({
        search: ''
      })
    )
  }
  handleClickOpenStudent = (event, id) => { window.location.assign(`/profile/students/${id}`) }
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
                <div className="contentSwicth contentSwicthStudents">
                  <p className="switch  switch-inProcess">Normal</p>
                  <p className="switch  switch-closed">Urgente</p>
                </div>
              </div>
              <div className="col-4">
                <div className="contentSwicth contentSwicthStudents">
                  <p className="switch  switch-visited">Interno</p>
                  <p className="switch  extern ">Externo</p>
                </div>
              </div>
            </div>

            <table className="table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Codigo</th>
                  <th>Nombre</th>
                  <th>Apellidos</th>
                  <th>Carrera</th>
                  <th>Estado</th>
                  <th>Tipo</th>
                  <th>Telefono</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {this.state.students.map((student, i) => (
                  <tr key={i}>
                    <td>{student.id}</td>
                    <td>{student.code}</td>
                    <td>{student.person.first_name}</td>
                    <td>{student.person.last_name}</td>
                    <td>{student.professional_school.name}</td>
                    <td>{student.urgent === false && <FontAwesomeIcon icon="circle" className="IconStatus in_process" />} {student.urgent === true && <FontAwesomeIcon icon="circle" className="IconStatus closed" />}</td>
                    <td className={student.status}>
                      <FontAwesomeIcon icon="circle" className="IconStatus" />
                    </td>
                    <td>{student.person.phone}</td>

                    <td>
                      <FontAwesomeIcon icon="eye" className="IconEye" onClick={(e) => this.handleClickOpenStudent(e, student.id)} />
                      {/* <FontAwesomeIcon icon="edit" className="IconEye" onClick={(e) => this.handleClickOpenStudent(e, student.id)} /> */}

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

export default Students

