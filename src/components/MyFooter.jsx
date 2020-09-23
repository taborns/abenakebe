import React, { useState } from 'react';
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem } from 'reactstrap';
  import ReorderIcon from '@material-ui/icons/Reorder';
  import HomeIcon from '@material-ui/icons/Home';
  import AccountCircleIcon from '@material-ui/icons/AccountCircle';
  import Icon from '@material-ui/core/Icon';

const MyFooter = (props) => {
  const [isOpen, setIsOpen] = useState(false);

  const toggle = () => setIsOpen(!isOpen);

  return (
    <div>
      <Navbar  color="light" light expand="md">
          <Nav className="ml-auto" navbar>
            <NavItem style={{ display : 'inline-block', padding : '0 3px', }}>
              <NavLink  href="/"> <HomeIcon style={{ marginBottom : '-6px' }} /> <span>መነሻ</span></NavLink>
            </NavItem>

            <NavItem style={{ display : 'inline-block', padding : '0 3px', }}>
            <NavLink  href="/profile/"><AccountCircleIcon style={{ marginBottom : '-6px' }} /> የግል ማህደር</NavLink>
            </NavItem>

          </Nav>
      </Navbar>
    </div>
  );
}

export default MyFooter;
