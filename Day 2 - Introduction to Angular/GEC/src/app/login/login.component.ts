import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule], // <--- Add these
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  email = '';
  password = '';
  rememberMe = false;

  constructor(private router: Router) {}

  onSubmit() {
    if (this.email && this.password) {
      alert(`Logging in with email: ${this.email} (Remember me: ${this.rememberMe})`);
      this.router.navigate(['/']);
    }
  }
}
