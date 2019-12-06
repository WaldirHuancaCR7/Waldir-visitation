import React, { Component } from 'react'
import PropTypes from "prop-types";
import axios from "axios";
import './ProfileVisits.scss'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

class Visits extends Component {
  state = {
    visits: []
  };
  componentDidMount() {
    axios
      .get("/api/v1/visits")
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
  handleClickViewVisits = (event, id) => { window.location.assign(`/visits/${id}`) }
  render() {
    return (
      <div className='row'>
        {this.state.visits.map((visit, i) => (
          <div className='col-6' key={i}>
            <div className='Profile ProfileVisits' onClick={(e) => this.handleClickViewVisits(e , visit.id)}>
              <div className='Profile-logoImg'>
                W
            </div>
              <div>
                <p className='Profile-name'>{visit.person.first_name} {visit.person.last_name}</p>
                <p className='Profile-name'>Fecha de visita:</p>
              </div>
            </div>
          </div>
          
        ))}
      </div>
    );
  }
}

export default Visits

