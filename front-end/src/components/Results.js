import React from 'react'
import Row from 'react-bootstrap/esm/Row'
import Col from 'react-bootstrap/esm/Col'
import 'bootstrap/dist/css/bootstrap.css';
import '../styles/Results.css'

const Results = (props) => {
    return ( 
    <div className='results'>
    { props.results.state === "500" ? null :
            (<Row>
                <Col className="result-container">
                    <h5>{props.results.prediction}</h5>
                </Col>
            </Row>)
            }
    </div>
    )
}

export default Results