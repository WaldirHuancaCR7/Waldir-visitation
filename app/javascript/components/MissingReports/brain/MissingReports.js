import React, { Component, Fragment } from "react";
import PropTypes from "prop-types";
import axios from 'axios'
// import './RequestVisit.scss'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import CardStudentDetails from '../../CardStudentDetails'
class MissingReports extends Component {
  state = {
    visits: []
  };
  componentDidMount() {
    axios
      .get("/api/v1/visits?status=visited")
      .then(res => {
        const missing_reports = res.data

        this.setState({
          visits: missing_reports
        });
      })
      .catch(err => {
        // console.log(err)
      });
  }
  handleClickOpenVisit = (e, id) => {
    window.location.assign(`/visits/${id}/report/new`)
  }
  render() {
    return (
      <Fragment>
        <div className="container">
          <div className="PanelTransparent">
            <div>
              <p className="PanelTransparent-title">Faltan Reportes</p>
            </div>
            <div className="PanelTransparent-options">
              <div className="contentSwicth">
                <p className="switch  switch-closed">{this.state.visits.length}</p>
              </div>
            </div>
          </div>
          <div className="row">
            {this.state.visits.map((visit, i) => {
              return (
                <CardStudentDetails visit={visit} key={i} onClickPanel={(e) => this.handleClickOpenVisit(e, visit.id)} />
              );
            })}
          </div>
        </div>
      </Fragment>
    );
  }
}

export default MissingReports;
