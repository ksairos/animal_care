import '../styles/Inputs.css'
import Col from 'react-bootstrap/Col';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Form from "react-bootstrap/Form"
import React from 'react'
import Button from 'react-bootstrap/esm/Button';
import 'bootstrap/dist/css/bootstrap.css';
import { useState } from 'react';
import axios from 'axios'
import Results from './Results';

const Inputs = (props) => {

    const [my_image, setImage] = useState(null);

    function handleFileChange(e){
        setImage({ selectedFile: e.target.files[0] });
    }

    function handlePredictClick(e){
        e.preventDefault();
        const formData = new FormData();
        formData.append(
            "myFile",
            my_image.selectedFile,
            my_image.selectedFile.name
        )
        console.log(my_image.selectedFile)
        axios.post(props.server_url + "/prediction", formData)
            .then((res) => {
                console.log(res)
            });
    }

    return (
        <Container>
            <div>
                <h1 className='title'>Pet's Health Examination</h1>
            </div>

            <div className="content">
                <Form>
                    <Row>
                        <Form.Group as={Col}>
                            <Form.Label>Dog Breed</Form.Label>
                            <Form.Select name='breed'>
                                <option>Select the breed</option>
                                <option>Breed 1</option>
                                <option>Breed 2</option>
                                <option>Breed 3</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group as={Col}>
                            <Form.Label>Size Type</Form.Label>
                            <Form.Select name='sizeType'>
                                <option>Select the Size type</option>
                                <option>Small</option>
                                <option>Medium</option>
                                <option>Large</option>
                            </Form.Select>
                        </Form.Group>
                    </Row>

                    <Row>
                        <Form.Group as={Col}>
                            <Form.Label>Weight</Form.Label>
                            <Form.Control
                                as="input"
                                name="weight">
                            </Form.Control>
                        </Form.Group>

                        <Form.Group as={Col}>
                            <Form.Label>Age</Form.Label>
                            <Form.Control
                                as="input"
                                name="age">
                            </Form.Control>
                        </Form.Group>
                    </Row>

                    <Form.Group as={Col}>
                        <Form.Label>Upload a picture of pet's feces</Form.Label>
                        <Form.Control type="file" name='file' id='file' onChange={handleFileChange}/>
                    </Form.Group>

                    <Row>
                        <Col>
                            <Button
                                block
                                variant="success"
                                action='/prediction'
                                method='post'
                            //   disabled={isLoading}
                              onClick={handlePredictClick}
                            >
                                {/* { isLoading ? 'Making prediction' : 'Predict' } */}
                                Predict
                            </Button>
                        </Col>
                        <Col>
                            <Button
                                block
                                variant="danger"
                            //   disabled={isLoading}
                            //   onClick={this.handleCancelClick}
                            >
                                Reset prediction
                            </Button>
                        </Col>
                    </Row>
                </Form>
                {/* {result === "" ? null :
            (<Row>
              <Col className="result-container">
                <h5 id="result">{result}</h5>
              </Col>
            </Row>)
          } */}
            </div>

            <Results results={props.prediction} />

        </Container>
    );
};

export default Inputs;