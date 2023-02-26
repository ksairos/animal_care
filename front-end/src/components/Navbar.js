import "../styles/Navbar.css";
import Button from 'react-bootstrap/Button';
import 'bootstrap/dist/css/bootstrap.css';

const Navbar = () => {
    return (
        <div className="navbar">
            <div className="list">
                <div className="logo">Animal Care</div>
                <div className="user">
                    <Button variant="outlined" className="btn">Login</Button>
                    <Button variant="contained" className="btn">Sign up</Button>
                </div>
            </div>
        </div>
    );
};

export default Navbar;