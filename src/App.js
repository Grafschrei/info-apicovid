import logo from "./logo.svg";
import logoCovid from "./covid.jpg";
import "./App.css";
import { useEffect, useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import { Bar } from "react-chartjs-2";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import BootstrapTable from "react-bootstrap-table-next";
import paginationFactory from "react-bootstrap-table2-paginator";
import * as ReactBootStrap from "react-bootstrap";
import {
  faHeartbeat,
  faMedkit,
  faUser,
  faFileMedicalAlt,
  faBars,
} from "@fortawesome/free-solid-svg-icons";
import axios from "axios";

function App() {
  const [registerCovid, setRegisteredCovid] = useState([]);
  const [loading, setLoading] = useState(false);

  const getRegisterCovid = async () => {
    try {
      const data = await axios.get(
        "https://api.covid19api.com/dayone/country/colombia/status/confirmed"
      );
      console.log(data);
      setRegisteredCovid(data.data);
      setLoading(true);
    } catch (e) {
      console.log(e);
    }
  };

  const columns = [
    { dataField: "Country", text: "Country" },
    { dataField: "Cases", text: "Cases" },
    { dataField: "Status", text: "Status" },
    { dataField: "CountryCode", text: "CountryCode" },
    {
      dataField: "Cases" ? (
        <FontAwesomeIcon icon={faHeartbeat} />
      ) : (
        <FontAwesomeIcon icon={faMedkit} />
      ),
      text: "Healthy",
    },
  ];

  useEffect(() => {
    getRegisterCovid();
  }, []);

  const data = {
    labels: ["Bogotá", "Santa Marta", "Medellín", "Cali"],
    datasets: [
      {
        label: "Infected",
        backgroundColor: "rgba(102,144,157)",
        borderColor: "black",
        borderWidth: 1,
        hoverBackgroundColor: "rgba(102,144,157)",
        hoverBorderColor: "#030055",
        data: [385.12, 587.02, 446.27, 421.13],
      },
    ],
  };

  const opciones = {
    maintainAspectRatio: false,
    responsive: true,
  };

  return (
    <div className="App">
      <div id="container" class="container-fluid">
        <div class="row">
          <div id="main-menu" class="col-md-2 mymain">
            <div class="navbar-brand myimg">
              <img
                src={logoCovid}
                width="300"
                height="200"
                class="img-fluid"
                alt=""
              />
            </div>
            <ul class="nav nav-pills flex-column text-uppercase">
              <li class="nav-item">
                <a class="nav-link text-dark mytext2" href="">
                  <i aria-hidden="true">
                    <FontAwesomeIcon icon={faFileMedicalAlt} />
                  </i>
                  Statistics
                </a>
              </li>
            </ul>
          </div>
          <div id="right-content" class="col-md-10 bg-light text-dark">
            <div class="row mynav">
              <div
                id="top-menu"
                class="col-12 bg-dark text-light d-flex align-items-center justify-content-between"
              >
                <div id="btn-menu" class="pull-left">
                  <i aria-hidden="true">
                    <FontAwesomeIcon icon={faBars} />
                  </i>
                </div>
                <div id="btn-menu" class="pull-right">
                  <div class="dropdown show">
                    <a
                      class="btn btn-light dropdown-toggle"
                      href="#"
                      role="button"
                      id="dropdownMenuLink"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <FontAwesomeIcon icon={faUser} />
                      Admin
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div style={{ width: "100%", height: "350px" }}>
              <h2>Regions in Colombia Infected</h2>
              <Bar
                style={{ width: "5%", height: "5%", position: "absolute" }}
                data={data}
                options={opciones}
              />
              <div>
                {loading ? (
                  <BootstrapTable
                    keyField="name"
                    data={registerCovid}
                    columns={columns}
                    pagination={paginationFactory()}
                  />
                ) : (
                  <ReactBootStrap.Spinner animation="border" />
                )}
              </div>
            </div>
            <br />
            <br />
            <div class="row">
              <div id="content" class="col-12">
                <br />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;
