import React, {Component, Fragment} from "react";
import axios from 'axios'
import './RequestVisit.scss'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

class RequestVisit extends Component {
  state = {
    students: [],
    urgent:'',
    search:''
  };
  componentDidMount() {
    this.getStudents()
  }
  getStudents = ()=>{
    axios
      .get(`/api/v1/students?q=${this.state.search}&${this.state.urgent}`)
      .then(res => {
        const newStudents = res.data
        this.setState({
          students: newStudents
        });
      })
      .catch(err => {
        // console.log(err)
      });
  }
  componentDidUpdate(prevProps, prevState,){
    if (prevState.urgent !== this.state.urgent || prevState.search !== this.state.search) {
      this.getStudents()
    }
  }

  handleClickRequestVisit = (event, id) => {window.location.assign(`/request_visits/${id}`)}

  handleOnchangeToogle = (e, a) => {
    if (this.state.urgent == '') {
      this.setState({
        urgent: 'urgent=true'
      })
    }
    else(
      this.setState({
        urgent: ''
      })
    )
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
  render() {
    return (
      <Fragment>
        <div className="container">
          <div className="PanelTransparent">
            <div>
              <p className="PanelTransparent-title">Visita</p>
            </div>
            <div className="PanelTransparent-options">
              <div className="ToogleContent">
                <p>Urgente</p>
                <label className="toogleSwitch">
                  <input type="checkbox" onChange={(e) =>  this.handleOnchangeToogle(e,this) }/>
                  <span className="slider round"></span>
                </label>
              </div>
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
          </div>
          <div className="row">
            {this.state.students.map((student, i) => {
              return (
                <div className="col-4" key={i}>
                  <div
                    className={student.urgent ? "Card Card-urgent " : "Card "}
                    onClick={e => this.handleClickRequestVisit(e, student.id)}
                  >
                    <img src={student.photo} className="Card-image" />
                    <div>
                      <p className="Card-name">
                        {student.person.first_name} {student.person.last_name}
                      </p>
                      <div>
                        <div className="Card-body">
                          <FontAwesomeIcon icon="phone" className="IconPhone" />
                          <p className="Card-body-text">
                            {student.person.phone}
                          </p>
                        </div>
                        <div className="Card-body">
                          <FontAwesomeIcon
                            icon="map-marker-alt"
                            className="IconUbication"
                          />
                          <p className="Card-body-text">{student.address}</p>
                        </div>
                      </div>
                      <p className="Card-professionalSchool">
                        {student.professional_school.name}
                      </p>
                      <p className="Card-studyCycle">
                        {student.study_cycle.name}
                      </p>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </Fragment>
    );
  }
}

export default RequestVisit;
