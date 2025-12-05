import React from 'react';
import { Route, Switch } from 'wouter';
import AdminDashboard from './components/AdminDashboard';
import DriverView from './components/DriverView';

function App() {
  return (
    <Switch>
      <Route path="/" component={AdminDashboard} />
      <Route path="/driver/:routeId" component={DriverView} />

      {/* Fallback for unknown routes */}
      <Route>
        <div style={{
          height: '100vh', background: '#0f172a', color: 'white',
          display: 'flex', alignItems: 'center', justifyContent: 'center', flexDirection: 'column'
        }}>
          <h2>404 - Página no encontrada</h2>
          <a href="/" style={{ color: '#3b82f6', marginTop: 10 }}>Volver al inicio</a>
        </div>
      </Route>
    </Switch>
  );
}

export default App;
