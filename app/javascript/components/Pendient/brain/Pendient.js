import React, { Component, Fragment } from "react";
import PropTypes from "prop-types";
import axios from 'axios'
// import './RequestVisit.scss'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import CardStudentDetails from '../../CardStudentDetails'
class Pendient extends Component {
  state = {
    visits: []
  };
  componentDidMount() {
    axios
      .get("/api/v1/visits?status=pendient")
      .then(res => {
        const pendient = res.data

        this.setState({
          visits: pendient
        });
      })
      .catch(err => {
        // console.log(err)
      });
  }
  handleClickOpenVisit = (e, id) => {
    window.location.assign(`/visits/${id}`)
  }
  render() {
    return (
      <Fragment>
        <div className="container">
          <div className="PanelTransparent">
            <div>
              <p className="PanelTransparent-title">Pendientes</p>
            </div>
            <div className="PanelTransparent-options">
              <div className="contentSwicth">
                <p className="switch  switch-pendient">{this.state.visits.length}</p>
              </div>
            </div>
          </div>
          <div className="row">
            {this.state.visits.map((visit, i) => {
              return (
                <CardStudentDetails visit={visit} key={i} onClickPanel={(e) => this.handleClickOpenVisit(e, visit.id)}/>                     
              );
            })}
          </div>
        </div>
      </Fragment>
    );
  }
}

export default Pendient;
